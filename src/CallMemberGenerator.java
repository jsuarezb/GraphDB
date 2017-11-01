import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CallMemberGenerator {

    private static int MIN_CALL_NUM = 2;
    private static int MAX_CALL_NUM = 5;

    private static double MIN_DURATION = 5;
    private static double MAX_DURATION = 2 * 60 * 60;

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
    }

    public static class RandomDateTime {

        private Timestamp timestamp;
        private int day;
        private int month;
        private int year;

        public RandomDateTime() {
            LocalDateTime javaDateTime =
                    LocalDateTime.ofEpochSecond(new Random().longs(971208394, 1507665994).findFirst().getAsLong(),
                            0, ZoneOffset.UTC);
            this.timestamp = Timestamp.valueOf(javaDateTime);
            this.day = javaDateTime.getDayOfMonth();
            this.month = javaDateTime.getMonth().getValue();
            this.year = javaDateTime.getYear();
        }

        public String toDateTime() {
            return new StringBuilder()
                    .append("INSERT INTO DateTime (Time, Day, Month, Year) VALUES (")
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

        public String toCall() {
            StringBuilder strBuilder = new StringBuilder();

            for (int member : members) {
                strBuilder.append("INSERT INTO Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (");
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


