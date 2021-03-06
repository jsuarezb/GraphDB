package graphframes;

import java.io.Serializable;
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

/**
 * This class creates the schema instance graph and the facts graph quite similar to like in the paper.
 */
public class DataGraph implements Serializable {

	private static final long serialVersionUID = 1072527792409191362L;

	private long id = 1L;

	private HashMap<String, Long> usersMap = new HashMap<>();
	private HashMap<String, Long> operatorsMap = new HashMap<>();
	private HashMap<String, Long> citiesMap = new HashMap<>();
	private HashMap<String, Long> countriesMap = new HashMap<>();
	private HashMap<String, Long> yearsMap = new HashMap<>();
	private HashMap<String, Long> monthYearsMap = new HashMap<>();
	private HashMap<String, Long> datesMap = new HashMap<>();
	private HashMap<String, Long> timestampMap = new HashMap<>();
	private HashMap<String, Long> allsMap = new HashMap<>();

	private HashMap<String, Long> phonesMap = new HashMap<>();
	private HashMap<String, Long> timesMap = new HashMap<>();
	
	private HashMap<Long, Long> phoneIdsMap = new HashMap<>();
	private HashMap<Long, Long> dateTimesIdsMap = new HashMap<>();
	private HashMap<Long, Long> callIdsMap = new HashMap<>();

	private ArrayList<Row> vertices = new ArrayList<Row>();
	private ArrayList<Row> edges = new ArrayList<Row>();
	
	private String directory;
	
	public DataGraph(String directory) {
		this.directory = directory;
	}

	public GraphFrame buildGraph(SparkSession sparkSession, JavaSparkContext sparkContext) {
		// Add all "all" vertices for each dimension (for the schema instance).
		newAll("Locations");
		newAll("Operators");
		newAll("Times");
		
		parseUsers(sparkContext);
		parseDateTimes(sparkContext);
		parseCalls(sparkContext);
		
		StructType verticesSchema = buildVerticesSchema();
		StructType edgesSchema = buildEdgesSchema();

		Dataset<Row> verticesDataset = sparkSession.createDataFrame(sparkContext.parallelize(vertices),
				verticesSchema);
		Dataset<Row> edgesDataset = sparkSession.createDataFrame(sparkContext.parallelize(edges),
				edgesSchema);
		
		return GraphFrame.apply(verticesDataset, edgesDataset);
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
			newSchemaInstanceLevel(allsMap.get("Locations"), countriesMap, "Locations", "country", country, "toAllLocations");
			newSchemaInstanceLevel(countriesMap.get(country), citiesMap, "Locations", "city", city, "inCountry");
			newSchemaInstanceLevel(citiesMap.get(city), usersMap, "Locations", "user", user, "inCity");
			newSchemaInstanceLevel(allsMap.get("Operators"), operatorsMap, "Operators", "operator", operator, "toAllOperators");
			newSchemaInstancePhone(usersMap.get(user), operatorsMap.get(operator), phone);
			newPhone(phone);
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
			newSchemaInstanceLevel(allsMap.get("Times"), yearsMap, "Times", "year", year, "toAllTimes");
			newSchemaInstanceLevel(yearsMap.get(year), monthYearsMap, "Times", "month", monthYear, "inYear");
			newSchemaInstanceLevel(monthYearsMap.get(monthYear), datesMap, "Times", "day", date, "inMonth");
			newSchemaInstanceLevel(datesMap.get(date), timestampMap, "Times", "timestamp", timestamp, "inDay");
			newTimestamp(timestamp);
			dateTimesIdsMap.put(id, timesMap.get(timestamp));
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
			newCall(id, phoneIdsMap.get(callerId), phoneIdsMap.get(memberId), dateTimesIdsMap.get(dateTimeId), duration);
		});
	}
	
	private void newAll(String dimension) {
		if (allsMap.containsKey(dimension)) {
			return;
		}
		vertices.add(RowFactory.create(id, "schemaInstance", new String[]{dimension}, "all" + dimension, "all" + dimension, null));
		allsMap.put(dimension, id++);
	}

	/**
	 * Add level to schema instance if it wasn't added already.
	 */
	private void newSchemaInstanceLevel(long topId, HashMap<String, Long> levelMap, String dimension, String type, String name, String edgeType) {
		if (levelMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, "schemaInstance", new String[]{dimension}, type, name, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(name, id++);
	}
	
	/**
	 * Similar to newSchemaInstanceLevel. However, phone corresponds to two dimensions and is guaranteed to be unique.
	 */
	private void newSchemaInstancePhone(long userId, long operatorId, String phone) {
		vertices.add(RowFactory.create(id, "schemaInstance", new String[]{"Locations", "Operators"}, "phone", phone, null));
		edges.add(RowFactory.create(id, userId, "ofUser"));
		edges.add(RowFactory.create(id++, operatorId, "ofOperator"));
	}
	
	/**
	 * Map csv id to graph id for later on edge creation.
	 */
	private <T> void newPhone(String phone) {
		if (phonesMap.containsKey(phone)) {
			return;
		}
		vertices.add(RowFactory.create(id, "phone", null, null, phone, null));
		phonesMap.put(phone, id++);
	}
	
	/**
	 * Map csv id to graph id for later on edge creation.
	 */
	private <T> void newTimestamp(String timestamp) {
		if (timesMap.containsKey(timestamp)) {
			return;
		}
		vertices.add(RowFactory.create(id, "timestamp", null, null, timestamp, null));
		timesMap.put(timestamp, id++);
	}
	
	/**
	 * If first time calling this method, create vertex, add edge to caller and time of call. 
	 * If not, just add the new integrant.
	 */
	private void newCall(long callId, long callerId, long memberId, long dateTimeId, int duration) {
		if (!callIdsMap.containsKey(callId)) {
			vertices.add(RowFactory.create(id, "call", null, null, null, new int[] {duration}));
			callIdsMap.put(callId, id++);
			edges.add(RowFactory.create(callIdsMap.get(callId), callerId, "calledBy"));
			edges.add(RowFactory.create(callIdsMap.get(callId), dateTimeId, "atTime"));
		}
		edges.add(RowFactory.create(callIdsMap.get(callId), memberId, "integratedBy"));
	}
	
	private static StructType buildVerticesSchema() {
		List<StructField> verticesFields = new ArrayList<StructField>();
		verticesFields.add(DataTypes.createStructField("id", DataTypes.LongType, true));
		verticesFields.add(DataTypes.createStructField("type", DataTypes.StringType, true));

		// Schema instances and data
		verticesFields.add(DataTypes.createStructField("label", DataTypes.createArrayType(DataTypes.StringType), true));
		verticesFields.add(DataTypes.createStructField("level", DataTypes.StringType, true));
		verticesFields.add(DataTypes.createStructField("value", DataTypes.StringType, true));

		// Call
		verticesFields.add(DataTypes.createStructField("duration", DataTypes.createArrayType(DataTypes.IntegerType), true));

		return DataTypes.createStructType(verticesFields);
	}

	private static StructType buildEdgesSchema() {
		List<StructField> edgesFields = new ArrayList<StructField>();
		edgesFields.add(DataTypes.createStructField("src", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("dst", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("label", DataTypes.StringType, true));
		return DataTypes.createStructType(edgesFields);
	}
}
