package graphframes;

import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.spark.SparkContext;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SQLContext;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

public class GraphMain {

	private static Long id = 1L;

	private static HashMap<String, Long> usersMap = new HashMap<>();
	private static HashMap<String, Long> phonesMap = new HashMap<>();;
	private static HashMap<String, Long> operatorsMap = new HashMap<>();;
	private static HashMap<String, Long> citiesMap = new HashMap<>();;
	private static HashMap<String, Long> countriesMap = new HashMap<>();;
	private static HashMap<Integer, Long> yearsMap = new HashMap<>();;
	private static HashMap<String, Long> monthYearsMap = new HashMap<>();;
	private static HashMap<String, Long> datesMap = new HashMap<>();;
	private static HashMap<String, Long> allsMap = new HashMap<>();;

	private static ArrayList<Row> vertices = new ArrayList<Row>();
	private static ArrayList<Row> edges = new ArrayList<Row>();

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		buildVerticesSchema();
		buildEdgesSchema();

		JavaRDD<String> userLines = sparkContext.textFile("csv_tables/v1/emisorreceptor.csv");
		JavaRDD<String> timeLines = sparkContext.textFile("csv_tables/v1/datetime.csv");
		JavaRDD<String> callLines = sparkContext.textFile("csv_tables/v1/call.csv");

		newAll("Locations");
		newAll("Operators");
		newAll("Times");
		
		userLines.foreach(line -> {
			String[] vars = line.split(",");
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
		});
		
		// association of both of them
		Dataset<Row> verticesDF = sparkSession.createDataFrame(sparkContext.parallelize(vertList), verticesSchema);

		return verticesDF;
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

	private static void newAll(String name) {
		if (allsMap.containsKey(name)) {
			return;
		}
		vertices.add(RowFactory.create(id, "all" + name, null, null, null, null));
		allsMap.put(name, id++);
	}

	private static <T> void newNamedLevel(long topId, HashMap<T, Long> levelMap, T key, String type, String edgeType) {
		if (levelMap.containsKey(key)) {
			return;
		}
		vertices.add(RowFactory.create(id, type, key, null, null, null));
		edges.add(RowFactory.create(id, topId, edgeType));
		levelMap.put(key, id++);
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
}
