import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CallMemberGenerator {

	private static int MIN_CALL_NUM = 2;
	private static int MAX_CALL_NUM = 5;

	private static double MIN_DURATION = 5;
	private static double MAX_DURATION = 2 * 60 * 60;
	private static final int EMISORRECEPTOR_COUNT = 10000;

	private static final String CREATE_SCHEMA_SQL = "lib/dbschema-create";
	private static final String EMISOR_RECEPTOR_SQL = "lib/emisorreceptor";

	private static final String PSQL_SCHEMA = "jdbc:postgresql";
	private static final String DB_HOST = "10.16.6.21";
	private static final String DB_PORT = "5432";
	private static final String DB_URL = "tp";
	private static final String USERNAME = "tcolloca";
	private static final String PASSWORD = USERNAME;

	public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
		Properties props = new Properties();
		props.setProperty("user", USERNAME);
		props.setProperty("password", PASSWORD);
		Class.forName("org.postgresql.Driver");
		String dbUrl = PSQL_SCHEMA + "://" + DB_HOST + ":" + DB_PORT + "/" + DB_URL;
		Connection conn = DriverManager.getConnection(dbUrl, props);
		conn.setAutoCommit(false);

		List<Integer> amounts = Arrays.asList(100000, 300000, 715000);
		int i = 1;
		for (Integer amount : amounts) {
			populate(conn, i--, amount, EMISORRECEPTOR_COUNT);
//			createFile(i++, amount, EMISORRECEPTOR_COUNT);
		}
	}

	private static void populate(Connection conn, int schema, int callAmount, int userAmount) throws IOException, SQLException {
		dropTables(conn, schema);
		createTables(conn, schema);
		insertEmisorReceptor(conn, schema, userAmount);
		insertCallsAndDateTime(conn, schema, userAmount, callAmount);
	}
	
	private static void dropTables(Connection conn, int schema) throws SQLException {
		conn.createStatement().execute("DROP IF EXISTS TABLE grupo2v" + schema + ".Call");
		conn.createStatement().execute("DROP IF EXISTS TABLE grupo2v" + schema + ".EmisorReceptor");
		conn.createStatement().execute("DROP IF EXISTS TABLE grupo2v" + schema + ".DateTime");
		conn.commit();
	}
	
	private static void createTables(Connection conn, int schema) throws SQLException {
		conn.createStatement().execute("CREATE TABLE grupo2v" + schema + ".DateTime (\r\n" + 
				"    Id     SERIAL PRIMARY KEY,\r\n" + 
				"	Time   TIMESTAMP,\r\n" + 
				"	Day    INTEGER,\r\n" + 
				"	Month  INTEGER,\r\n" + 
				"	Year   INTEGER\r\n" + 
				")");
		
		conn.createStatement().execute("CREATE TABLE grupo2v" + schema + ".EmisorReceptor (\r\n" + 
				"	Id       SERIAL PRIMARY KEY,\r\n" + 
				"	TelNum   CHARACTER(12),\r\n" + 
				"	Operator VARCHAR(64),\r\n" + 
				"	UserName VARCHAR(64),\r\n" + 
				"	City     VARCHAR(64),\r\n" + 
				"	Country  VARCHAR(64)\r\n" + 
				")");
		
		conn.createStatement().execute("CREATE TABLE grupo2v" + schema + ".Call (\r\n" + 
				"    Id       INTEGER,\r\n" + 
				" 	TimeId 	 INTEGER REFERENCES grupo2v" + schema + ".DateTime,\r\n" + 
				"  	CallerId INTEGER REFERENCES grupo2v" + schema + ".EmisorReceptor,\r\n" + 
				"  	MemberId INTEGER REFERENCES grupo2v" + schema + ".EmisorReceptor,\r\n" + 
				"  	Duration INTEGER,\r\n" + 
				"\r\n" + 
				"  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)\r\n" + 
				")");
	}
	
	private static void insertEmisorReceptor(Connection conn, int schema, int userAmount) throws IOException, SQLException {
		List<String> userLines = Files.readAllLines(Paths.get(EMISOR_RECEPTOR_SQL + schema + ".sql")).stream()
				.skip(10000 - userAmount).collect(Collectors.toList());
		
		for (int i = 0; i < userLines.size(); i++) {
			if (i % 100 == 0) {
				System.out.println(String.format("Emisor Receptor progress: %.2f %%", (i / (double) EMISORRECEPTOR_COUNT * 100)));
				conn.commit();
			}
			conn.createStatement().execute(userLines.get(i));
		}
		conn.commit();
	}
	
	private static void insertCallsAndDateTime(Connection conn, int schema, int userAmount, int callAmount) throws SQLException {
		Iterator<Integer> memsAmountIt = new Random().ints(MIN_CALL_NUM, MAX_CALL_NUM + 1).iterator();
		Iterator<Double> durationsIt = new Random().doubles(MIN_DURATION, MAX_DURATION).iterator();
		List<Integer> userIds = IntStream.range(1, userAmount + 1).boxed().collect(Collectors.toList());
		int i = 0;
		for (int callId = 1; callId <= callAmount; callId++) {
			if (callId % 10000 == 0) {
				System.out.println(String.format("Call progress: %.2f %%", (callId / (double) callAmount * 100)));
			}
			RandomDateTime time = new RandomDateTime();

			if (i++ % 1000 == 0) {
				conn.commit();
			}
			conn.createStatement().execute(time.toDateTime(schema));

			Collections.shuffle(userIds);
			Call call = new Call(callId, new ArrayList<>(userIds.subList(0, memsAmountIt.next())), callId,
					durationsIt.next());

			conn.createStatement().execute(call.toCall(schema));
		}
		conn.commit();
	}
	
	private static void createFile(int schema, int callAmount, int userAmount) throws IOException {
		Iterator<Integer> memsAmountIt = new Random().ints(MIN_CALL_NUM, MAX_CALL_NUM + 1).iterator();
		Iterator<Double> durationsIt = new Random().doubles(MIN_DURATION, MAX_DURATION).iterator();

		List<Integer> userIds = IntStream.range(1, userAmount + 1).boxed().collect(Collectors.toList());

		final StringBuilder auxStrBuilder = new StringBuilder();

		System.out.println("Reading create schema...");

		Files.readAllLines(Paths.get(CREATE_SCHEMA_SQL + schema + ".sql"))
				.forEach(line -> auxStrBuilder.append(line).append("\n"));

		System.out.println("Reading emisor receptor...");

		auxStrBuilder.append("BEGIN;");

		List<String> userLines = Files.readAllLines(Paths.get(EMISOR_RECEPTOR_SQL + schema + ".sql")).stream()
				.skip(10000 - userAmount).collect(Collectors.toList());
		IntStream.range(0, userLines.size()).forEach(i -> {
			if (i % 1000 == 0) {
				auxStrBuilder.append("COMMIT;");
				auxStrBuilder.append("BEGIN;");
			}
			auxStrBuilder.append(userLines.get(i)).append("\n");
		});

		auxStrBuilder.append("COMMIT;");

		Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), auxStrBuilder.toString().getBytes(),
				StandardOpenOption.CREATE);

		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("BEGIN;");

		int i = 0;
		for (int callId = 1; callId <= callAmount; callId++) {
			if (callId % 10000 == 0) {
				System.out.println(String.format("Call progress: %.2f %%", (callId / (double) callAmount * 100)));
			}
			RandomDateTime time = new RandomDateTime();

			if (i++ % 1000 == 0) {
				strBuilder.append("COMMIT;");
				strBuilder.append("BEGIN;");
				Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), strBuilder.toString().getBytes(),
						StandardOpenOption.APPEND);
				strBuilder = new StringBuilder();
			}
			strBuilder.append(time.toDateTime(schema));

			Collections.shuffle(userIds);
			Call call = new Call(callId, new ArrayList<>(userIds.subList(0, memsAmountIt.next())), callId,
					durationsIt.next());

			strBuilder.append(call.toCall(schema));
		}

		strBuilder.append("COMMIT;");

		Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), strBuilder.toString().getBytes(),
				StandardOpenOption.APPEND);

		System.out.println("Finished!");
	}

	public static class RandomDateTime {

		private Timestamp timestamp;
		private int day;
		private int month;
		private int year;

		public RandomDateTime() {
			LocalDateTime javaDateTime = LocalDateTime.ofEpochSecond(
					new Random().longs(1483228800, 1498867199).findFirst().getAsLong(), 0, ZoneOffset.UTC);
			this.timestamp = Timestamp.valueOf(javaDateTime);
			this.day = javaDateTime.getDayOfMonth();
			this.month = javaDateTime.getMonth().getValue();
			this.year = javaDateTime.getYear();
		}

		public String toDateTime(int schema) {
			return new StringBuilder()
					.append("INSERT INTO grupo2v" + schema + ".DateTime (Time, Day, Month, Year) VALUES (")
					.append("TIMESTAMP '" + timestamp + "'").append(", ").append(day).append(", ").append(month)
					.append(", ").append(year).append(");\n").toString();
		}
	}

	public static class Call {
		int id;
		List<Integer> members;
		private int dateTimeId;
		private double duration;

		public Call(int id, List<Integer> members, int dateTimeId, double duration) {
			super();
			this.id = id;
			this.members = members;
			this.dateTimeId = dateTimeId;
			this.duration = duration;
		}

		public String toCall(int schema) {
			StringBuilder strBuilder = new StringBuilder();

			for (int member : members) {
				strBuilder.append(
						"INSERT INTO grupo2v" + schema + ".Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (");
				strBuilder.append(id);
				strBuilder.append(", ");
				strBuilder.append(dateTimeId);
				strBuilder.append(", ");
				strBuilder.append(members.get(0));
				strBuilder.append(", ");
				strBuilder.append(member);
				strBuilder.append(", ");
				strBuilder.append(duration);
				strBuilder.append(");\n");
			}
			return strBuilder.toString();
		}
	}
}
