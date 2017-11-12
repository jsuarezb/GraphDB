package graphframes;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;
import org.graphframes.GraphFrame;

public class GraphMain {

	private static Long id = 1L;

	private static HashMap<String, Long> usersMap = new HashMap<>();
	private static HashMap<String, Long> phonesMap = new HashMap<>();
	private static HashMap<String, Long> operatorsMap = new HashMap<>();
	private static HashMap<String, Long> citiesMap = new HashMap<>();
	private static HashMap<String, Long> countriesMap = new HashMap<>();
	private static HashMap<String, Long> yearsMap = new HashMap<>();
	private static HashMap<String, Long> monthYearsMap = new HashMap<>();
	private static HashMap<String, Long> datesMap = new HashMap<>();
	private static HashMap<String, Long> timestampMap = new HashMap<>();
	private static HashMap<String, Long> allsMap = new HashMap<>();
	
	private static HashMap<Long, Long> phoneIdsMap = new HashMap<>();
	private static HashMap<Long, Long> dateTimeIdsMap = new HashMap<>();
	private static HashMap<Long, Long> callIdsMap = new HashMap<>();

	private static ArrayList<Row> vertices = new ArrayList<Row>();
	private static ArrayList<Row> edges = new ArrayList<Row>();
	
	private static int SCHEMA = 1;

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		StructType verticesSchema = buildVerticesSchema();
		StructType edgesSchema =buildEdgesSchema();

		populate(sparkContext);
		
		Dataset<Row> verticesDataset = sparkSession.createDataFrame(sparkContext.parallelize(vertices), verticesSchema);
		Dataset<Row> edgesDataset = sparkSession.createDataFrame(sparkContext.parallelize(edges), edgesSchema);
		
		GraphFrame graph = GraphFrame.apply(verticesDataset, edgesDataset);
		
		System.out.println(graph.vertices().filter("type = 'phone'").count());
		System.out.println(graph.vertices().filter("type = 'timestamp'").count());
		System.out.println(graph.vertices().filter("type = 'call'").count());
	}

	private static StructType buildVerticesSchema() {
		List<StructField> verticesFields = new ArrayList<StructField>();
		verticesFields.add(DataTypes.createStructField("id", DataTypes.LongType, true));
		verticesFields.add(DataTypes.createStructField("type", DataTypes.StringType, true));

		// User | City | Country | Operator
		verticesFields.add(DataTypes.createStructField("name", DataTypes.StringType, true));

		// Phone
		verticesFields.add(DataTypes.createStructField("phoneNumber", DataTypes.StringType, true));

		// DateTime | Day | Month | Year
		verticesFields.add(DataTypes.createStructField("number", DataTypes.IntegerType, true));

		// Call
		verticesFields.add(DataTypes.createStructField("duration", DataTypes.IntegerType, true));

		return DataTypes.createStructType(verticesFields);
	}

	private static StructType buildEdgesSchema() {
		List<StructField> edgesFields = new ArrayList<StructField>();
		edgesFields.add(DataTypes.createStructField("src", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("dst", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("label", DataTypes.StringType, true));
		return DataTypes.createStructType(edgesFields);
	}

	private static void populate(JavaSparkContext sparkContext) {
		newAll("Locations");
		newAll("Operators");
		newAll("Times");
		
		parseUsers(sparkContext);
		parseDateTimes(sparkContext);
		parseCalls(sparkContext);
	}
	
	private static void parseUsers(JavaSparkContext sparkContext) {
		JavaRDD<String> userLines = sparkContext.textFile("csv_tables/v" + SCHEMA + "/emisorreceptor.csv");
		userLines.foreach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			String phone = vars[1];
			String operator = vars[2];
			String username = vars[3];
			String city = vars[4];
			String country = vars[5];
			newNamedLevel(allsMap.get("Locations"), countriesMap, country, "country", "toAllLocations");
			newNamedLevel(countriesMap.get(country), citiesMap, city, "city", "inCountry");
			newNamedLevel(citiesMap.get(city), usersMap, username, "username", "inCity");
			newNamedLevel(allsMap.get("Operators"), operatorsMap, operator, "operator", "toAllOperators");
			newPhone(operator, username, phone);
			phoneIdsMap.put(id, timestampMap.get(phone));
		});
	}
	
	private static void parseDateTimes(JavaSparkContext sparkContext) {
		JavaRDD<String> timeLines = sparkContext.textFile("csv_tables/v" + SCHEMA + "/datetime.csv");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		timeLines.foreach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			int seconds = LocalTime.parse(vars[1].split(" ")[1], formatter).toSecondOfDay();
			int day = Integer.parseInt(vars[2]);
			int month = Integer.parseInt(vars[3]);
			int year = Integer.parseInt(vars[4]);
			String monthYear = month + "-" + year;
			String date = day + "-" + monthYear;
			String timestamp = seconds + "-" + date;
			newNumberedLevel(allsMap.get("Times"), yearsMap, year, "" + year, "year", "toAllTimes");
			newNumberedLevel(yearsMap.get("" + year), monthYearsMap, month, monthYear, "month", "inYear");
			newNumberedLevel(monthYearsMap.get(monthYear), datesMap, day, date, "day", "inMonth");
			newNumberedLevel(datesMap.get(date), timestampMap, seconds, timestamp, "timestamp", "inDay");
			dateTimeIdsMap.put(id, timestampMap.get(timestamp));
		});
	}
	
	private static void parseCalls(JavaSparkContext sparkContext) {
		JavaRDD<String> callLines = sparkContext.textFile("csv_tables/v" + SCHEMA + "/call.csv");
		
		callLines.foreach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			long dateTimeId = Long.parseLong(vars[1]);
			long callerId = Long.parseLong(vars[2]);
			long memberId = Long.parseLong(vars[3]);
			int duration = Integer.parseInt(vars[4]);
			newCall(id, dateTimeId, callerId, memberId, duration);
		});
	}
	
	private static void newAll(String name) {
		if (allsMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, "all" + name, null, null, null, null));
		allsMap.put(name, id++);
	}

	private static void newNamedLevel(long topId, HashMap<String, Long> levelMap, String name, String type, String edgeType) {
		if (levelMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, type, name, null, null, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(name, id++);
	}
	
	private static <T> void newPhone(String operator, String user, String phone) {
		if (phonesMap.containsKey(phone)) {
			return;
		}
		vertices.add(RowFactory.create(id, "phone", null, phone, null, null));
		edges.add(RowFactory.create(id, operatorsMap.get(operator), "fromOperator"));
		edges.add(RowFactory.create(id, operatorsMap.get(operator), "belongsTo"));
		phonesMap.put(phone, id++);
	}
	
	private static void newNumberedLevel(long topId, HashMap<String, Long> levelMap, int number, String key, String type, String edgeType) {
		if (levelMap.containsKey(key)) {
			return;
		}
		vertices.add(RowFactory.create(id, type, null, null, number, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(key, id++);
	}
	
	private static void newCall(long callId, long dateTimeId, long callerId, long memberId, int duration) {
		if (!callIdsMap.containsKey(callId)) {
			vertices.add(RowFactory.create(id, "call", null, null, null, duration));
			callIdsMap.put(callId, id++);
		}
		edges.add(RowFactory.create(callIdsMap.get(callId), dateTimeId, "atTimestamp"));
		edges.add(RowFactory.create(callIdsMap.get(callId), callerId, "calledBy"));
		edges.add(RowFactory.create(callIdsMap.get(callId), memberId, "integratedBy"));
	}
}
