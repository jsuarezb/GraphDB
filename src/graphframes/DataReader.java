package graphframes;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;

public class DataReader implements Serializable {

	private static final long serialVersionUID = 1072527792409191362L;

	private long id = 1L;

	private HashMap<String, Long> usersMap = new HashMap<>();
	private HashMap<String, Long> phonesMap = new HashMap<>();
	private HashMap<String, Long> operatorsMap = new HashMap<>();
	private HashMap<String, Long> citiesMap = new HashMap<>();
	private HashMap<String, Long> countriesMap = new HashMap<>();
	private HashMap<String, Long> yearsMap = new HashMap<>();
	private HashMap<String, Long> monthYearsMap = new HashMap<>();
	private HashMap<String, Long> datesMap = new HashMap<>();
	private HashMap<String, Long> timestampMap = new HashMap<>();
	private HashMap<String, Long> allsMap = new HashMap<>();
	
	private HashMap<Long, Long> phoneIdsMap = new HashMap<>();
	private HashMap<Long, Long> dateTimeIdsMap = new HashMap<>();
	private HashMap<Long, Long> callIdsMap = new HashMap<>();

	private ArrayList<Row> vertices = new ArrayList<Row>();
	private ArrayList<Row> edges = new ArrayList<Row>();
	
	private String directory;
	
	public DataReader(String directory) {
		this.directory = directory;
	}

	public void populate(JavaSparkContext sparkContext) {
		newAll("Locations");
		newAll("Operators");
		newAll("Times");
		
		parseUsers(sparkContext);
		parseDateTimes(sparkContext);
		parseCalls(sparkContext);
	}
	
	private void parseUsers(JavaSparkContext sparkContext) {
		JavaRDD<String> userLines = sparkContext.textFile(directory + "/emisorreceptor.csv");
		userLines.collect().forEach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			String phone = vars[1];
			String operator = vars[2];
			String user = vars[3];
			String city = vars[4];
			String country = vars[5];
			newNamedLevel(allsMap.get("Locations"), countriesMap, country, "country", "toAllLocations");
			newNamedLevel(countriesMap.get(country), citiesMap, city, "city", "inCountry");
			newNamedLevel(citiesMap.get(city), usersMap, user, "user", "inCity");
			newNamedLevel(allsMap.get("Operators"), operatorsMap, operator, "operator", "toAllOperators");
			newPhone(operator, user, phone);
			phoneIdsMap.put(id, phonesMap.get(phone));
		});
	}
	
	private void parseDateTimes(JavaSparkContext sparkContext) {
		JavaRDD<String> timeLines = sparkContext.textFile(directory + "/datetime.csv");

		timeLines.collect().forEach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			String time = vars[1].split(" ")[1];
			String day = vars[2];
			String month = vars[3];
			String year = vars[4];
			String monthYear = month + "-" + year;
			String date = day + "-" + monthYear;
			String timestamp = time + " " + date;
			newDateTimeLevel(allsMap.get("Times"), yearsMap, year, "year", "toAllTimes");
			newDateTimeLevel(yearsMap.get(year), monthYearsMap, monthYear, "month", "inYear");
			newDateTimeLevel(monthYearsMap.get(monthYear), datesMap, date, "day", "inMonth");
			newDateTimeLevel(datesMap.get(date), timestampMap, timestamp, "timestamp", "inDay");
			dateTimeIdsMap.put(id, timestampMap.get(timestamp));
		});
	}
	
	private void parseCalls(JavaSparkContext sparkContext) {
		JavaRDD<String> callLines = sparkContext.textFile(directory + "/call.csv");
		
		callLines.collect().forEach(line -> {
			String[] vars = line.split(",");
			long id = Long.parseLong(vars[0]);
			long dateTimeId = Long.parseLong(vars[1]);
			long callerId = Long.parseLong(vars[2]);
			long memberId = Long.parseLong(vars[3]);
			int duration = Integer.parseInt(vars[4]);
			newCall(id, dateTimeIdsMap.get(dateTimeId), phoneIdsMap.get(callerId), phoneIdsMap.get(memberId), duration);
		});
	}
	
	private void newAll(String name) {
		if (allsMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, "all" + name, null, null, null, null));
		allsMap.put(name, id++);
	}

	private void newNamedLevel(long topId, HashMap<String, Long> levelMap, String name, String type, String edgeType) {
		if (levelMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, type, name, null, null, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(name, id++);
	}
	
	private <T> void newPhone(String operator, String user, String phone) {
		if (phonesMap.containsKey(phone)) {
			return;
		}
		vertices.add(RowFactory.create(id, "phone", null, phone, null, null));
		edges.add(RowFactory.create(id, operatorsMap.get(operator), "fromOperator"));
		edges.add(RowFactory.create(id, usersMap.get(user), "belongsTo"));
		phonesMap.put(phone, id++);
	}
	
	private void newDateTimeLevel(long topId, HashMap<String, Long> levelMap, String dateTime, String type, String edgeType) {
		if (levelMap.containsKey(dateTime)) {
			return;
		}
		vertices.add(RowFactory.create(id, type, null, null, dateTime, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(dateTime, id++);
	}
	
	private void newCall(long callId, long dateTimeId, long callerId, long memberId, int duration) {
		if (!callIdsMap.containsKey(callId)) {
			vertices.add(RowFactory.create(id, "call", null, null, null, duration));
			callIdsMap.put(callId, id++);
			edges.add(RowFactory.create(callIdsMap.get(callId), dateTimeId, "atTimestamp"));
			edges.add(RowFactory.create(callIdsMap.get(callId), callerId, "calledBy"));
		}
		edges.add(RowFactory.create(callIdsMap.get(callId), memberId, "integratedBy"));
	}

	public ArrayList<Row> getVertices() {
		return vertices;
	}

	public ArrayList<Row> getEdges() {
		return edges;
	}
}
