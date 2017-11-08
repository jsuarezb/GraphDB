import java.io.IOException;
import java.nio.file.Files;
<<<<<<< HEAD
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
=======
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.*;
>>>>>>> 58f23333dfabac6788dee87bd34b8c75c718de5c
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CallMemberGenerator {

    private static int MIN_CALL_NUM = 2;
    private static int MAX_CALL_NUM = 5;

    private static double MIN_DURATION = 5;
    private static double MAX_DURATION = 2 * 60 * 60;

<<<<<<< HEAD
    private static final String CREATE_SCHEMA_SQL   = "lib/dbschema-create";
    private static final String EMISOR_RECEPTOR_SQL = "lib/emisorreceptor";

    public static void main(String[] args) throws IOException {
        List<Integer> amounts = Arrays.asList(100000, 300000, 715000);

        int i = 3;
        for (Integer amount : amounts)
            createFile(i--, amount, 10000);
    }

    private static void createFile(int schema, int callAmount, int userAmount) throws IOException {
        Iterator<Integer> memsAmountIt = new Random().ints(MIN_CALL_NUM, MAX_CALL_NUM + 1).iterator();
        Iterator<Double> durationsIt   = new Random().doubles(MIN_DURATION, MAX_DURATION).iterator();

//        Set<RandomDateTime> times = new HashSet<>();
//        List<Call> calls      = new ArrayList<>();
        List<Integer> userIds = IntStream.range(1, userAmount + 1).boxed().collect(Collectors.toList());

        final StringBuilder auxStrBuilder = new StringBuilder();

        System.out.println("Reading create schema...");	
        
        Files.readAllLines(Paths.get(CREATE_SCHEMA_SQL + schema + ".sql"))
                .forEach(line -> auxStrBuilder.append(line).append("\n"));

        System.out.println("Reading emisor receptor...");
        
        auxStrBuilder.append("BEGIN;");

        List<String> userLines = Files.readAllLines(Paths.get(EMISOR_RECEPTOR_SQL + schema + ".sql")).stream()
        		.skip(10000 - userAmount)
        		.collect(Collectors.toList());
        IntStream.range(0, userLines.size()).forEach(i -> {
                	if (i % 1000 == 0) {
                		auxStrBuilder.append("COMMIT;");
                		auxStrBuilder.append("BEGIN;");
                	}
                	auxStrBuilder.append(userLines.get(i)).append("\n");
        });

        auxStrBuilder.append("COMMIT;");
        
     	Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), auxStrBuilder.toString().getBytes(), StandardOpenOption.CREATE);

     	StringBuilder strBuilder = new StringBuilder();
     	strBuilder.append("BEGIN;");
        
        int i = 0;
        for (int callId = 1; callId <= callAmount; callId++) {
        	if (callId % 10000 == 0) {
        		System.out.println(String.format("Call progress: %.2f %%", (callId / (double) callAmount * 100)));
        	}
            RandomDateTime time = new RandomDateTime();
//            times.add(time);
            
            if (i++ % 1000 == 0) {
        		strBuilder.append("COMMIT;");
        		strBuilder.append("BEGIN;");
        		Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), strBuilder.toString().getBytes(), StandardOpenOption.APPEND);
        		strBuilder = new StringBuilder();
        	}
            strBuilder.append(time.toDateTime(schema));

            Collections.shuffle(userIds);
            Call call = new Call(callId, new ArrayList<>(userIds.subList(0, memsAmountIt.next())),
                    callId, durationsIt.next());
//            calls.add(call);
            
            strBuilder.append(call.toCall(schema));
        }
        
//        int i = 0;
//        for (RandomDateTime time : times) {
//        	if (i++ % 1000 == 0) {
//        		strBuilder.append("COMMIT;");
//        		strBuilder.append("BEGIN;");
//        	}
//            strBuilder.append(time.toDateTime(schema));
//        }

//        for (Call call : calls) {
//        	if (i++ % 300 == 0) {
//        		strBuilder.append("COMMIT;");
//        		strBuilder.append("BEGIN;");
//        	}
//            strBuilder.append(call.toCall(schema));
//        }
        strBuilder.append("COMMIT;");
        
		Files.write(Paths.get(String.format("lib/data%d.sql", callAmount)), strBuilder.toString().getBytes(), StandardOpenOption.APPEND);
        
        System.out.println("Finished!");
=======
    private static final Path CREATE_SCHEMA_SQL_PATH   = Paths.get("lib/dbschema-create.sql");
    private static final Path EMISOR_RECEPTOR_SQL_PATH = Paths.get("lib/emisorreceptor.sql");

    public static void main(String[] args) throws IOException {
        List<Integer> amounts = Arrays.asList(100, 200, 1000);

        for (Integer amount : amounts)
            createFile(amount, amount);
    }

    private static void createFile(int callAmount, int userAmount) throws IOException {
        Iterator<Integer> memsAmountIt = new Random().ints(MIN_CALL_NUM, MAX_CALL_NUM + 1).iterator();
        Iterator<Double> durationsIt   = new Random().doubles(MIN_DURATION, MAX_DURATION).iterator();

        List<RandomDateTime> times = new ArrayList<>();
        List<Call> calls      = new ArrayList<>();
        List<Integer> userIds = IntStream.range(1, userAmount + 1).boxed().collect(Collectors.toList());

        StringBuilder strBuilder = new StringBuilder();

        Files.readAllLines(CREATE_SCHEMA_SQL_PATH)
                .forEach(line -> strBuilder.append(line).append("\n"));

        Files.readAllLines(EMISOR_RECEPTOR_SQL_PATH).stream()
                .skip(1000 - userAmount)
                .forEach(line -> strBuilder.append(line).append("\n"));

        for (int callId = 1; callId <= callAmount; callId++) {
            RandomDateTime time = new RandomDateTime();
            times.add(time);

            Collections.shuffle(userIds);
            calls.add(new Call(callId, new ArrayList<>(userIds.subList(0, memsAmountIt.next())),
                    callId, durationsIt.next()));
        }

        for (RandomDateTime time : times) {
            strBuilder.append(time.toDateTime());
        }

        for (Call call : calls) {
            strBuilder.append(call.toCall());
        }

        Files.write(Paths.get(String.format("lib/data(%d-%d).sql", userAmount, callAmount)), strBuilder.toString().getBytes());
>>>>>>> 58f23333dfabac6788dee87bd34b8c75c718de5c
    }

    public static class RandomDateTime {

        private Timestamp timestamp;
        private int day;
        private int month;
        private int year;

        public RandomDateTime() {
            LocalDateTime javaDateTime =
<<<<<<< HEAD
                    LocalDateTime.ofEpochSecond(new Random().longs(1483228800, 1498867199).findFirst().getAsLong(),
=======
                    LocalDateTime.ofEpochSecond(new Random().longs(971208394, 1507665994).findFirst().getAsLong(),
>>>>>>> 58f23333dfabac6788dee87bd34b8c75c718de5c
                            0, ZoneOffset.UTC);
            this.timestamp = Timestamp.valueOf(javaDateTime);
            this.day = javaDateTime.getDayOfMonth();
            this.month = javaDateTime.getMonth().getValue();
            this.year = javaDateTime.getYear();
        }

<<<<<<< HEAD
        public String toDateTime(int schema) {
            return new StringBuilder()
                    .append("INSERT INTO grupo2v" + schema + ".DateTime (Time, Day, Month, Year) VALUES (")
=======
        public String toDateTime() {
            return new StringBuilder()
                    .append("INSERT INTO DateTime (Time, Day, Month, Year) VALUES (")
>>>>>>> 58f23333dfabac6788dee87bd34b8c75c718de5c
                    .append("TIMESTAMP '" + timestamp + "'")
                    .append(", ")
                    .append(day)
                    .append(", ")
                    .append(month)
                    .append(", ")
                    .append(year)
                    .append(");\n")
                    .toString();
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

<<<<<<< HEAD
        public String toCall(int schema) {
            StringBuilder strBuilder = new StringBuilder();

            for (int member : members) {
                strBuilder.append("INSERT INTO grupo2v" + schema + ".Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (");
=======
        public String toCall() {
            StringBuilder strBuilder = new StringBuilder();

            for (int member : members) {
                strBuilder.append("INSERT INTO Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (");
>>>>>>> 58f23333dfabac6788dee87bd34b8c75c718de5c
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


