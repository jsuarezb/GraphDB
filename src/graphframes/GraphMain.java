package graphframes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;
import org.graphframes.GraphFrame;

public class GraphMain {

	private static List<String> vertexFields = new ArrayList<>();
	private static List<String> locationsHierarchy = new ArrayList<>();
	private static List<String> timesHierarchy = new ArrayList<>();
	private static List<String> operatorsHierarchy = new ArrayList<>();

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		StructType verticesSchema = buildVerticesSchema();
		StructType edgesSchema = buildEdgesSchema();

		DataReader dataReader = new DataReader(args[0]);
		dataReader.populate(sparkContext);

		Dataset<Row> verticesDataset = sparkSession.createDataFrame(sparkContext.parallelize(dataReader.getVertices()),
				verticesSchema);
		Dataset<Row> edgesDataset = sparkSession.createDataFrame(sparkContext.parallelize(dataReader.getEdges()),
				edgesSchema);

		GraphFrame graph = GraphFrame.apply(verticesDataset, edgesDataset);

		graph.vertices().show(1000);
		graph.edges().show(1000);

		// System.out.println(graph.vertices().filter("type = 'phone'").count());
		// System.out.println(graph.vertices().filter("type = 'timestamp'").count());
		// System.out.println(graph.vertices().filter("type = 'call'").count());

		GraphFrame newGraph = rollUp(sparkSession, graph, "day");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);

		newGraph = rollUp(sparkSession, graph, "city");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);

		newGraph = rollUp(sparkSession, graph, "operator");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);

		newGraph = rollUp(sparkSession, graph, "phone");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);
		
		newGraph = rollUp(sparkSession, graph, "allTimes");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);
		// rollUp(sparkSession, graph, "city", "name");
		// rollUp(sparkSession, graph, "operator", "name");
		// rollUp(sparkSession, graph, "phone", "phoneNumber");
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
		verticesFields.add(DataTypes.createStructField("dateTime", DataTypes.StringType, true));

		// Call
		verticesFields.add(DataTypes.createStructField("duration", DataTypes.IntegerType, true));

		vertexFields.addAll(Arrays.asList("name", "phoneNumber", "dateTime", "duration"));

		timesHierarchy.addAll(Arrays.asList("timestamp", "day", "month", "year", "allTimes"));
		locationsHierarchy.addAll(Arrays.asList("phone", "user", "city", "country", "allLocations"));
		operatorsHierarchy.addAll(Arrays.asList("phone", "operator", "allOperators"));

		return DataTypes.createStructType(verticesFields);
	}

	private static StructType buildEdgesSchema() {
		List<StructField> edgesFields = new ArrayList<StructField>();
		edgesFields.add(DataTypes.createStructField("src", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("dst", DataTypes.LongType, true));
		edgesFields.add(DataTypes.createStructField("label", DataTypes.StringType, true));
		return DataTypes.createStructType(edgesFields);
	}
	
	private static GraphFrame max(SparkSession sparkSession, GraphFrame graph, String level) {
		return agg(sparkSession, graph, level, "MAX");
	}
	
	private static GraphFrame avg(SparkSession sparkSession, GraphFrame graph, String level) {
		return agg(sparkSession, graph, level, "AVG");
	}
	
	private static GraphFrame count(SparkSession sparkSession, GraphFrame graph, String level) {
		return agg(sparkSession, graph, level, "COUNT");
	}
	
	private static GraphFrame agg(SparkSession sparkSession, GraphFrame graph, String level, String agg) {
		GraphFrame newGraph = rollUp(sparkSession, graph, level);
		newGraph.vertices().createOrReplaceTempView("v_table");
		
		return null;
	}

	private static GraphFrame rollUp(SparkSession sparkSession, GraphFrame graph, String level) {
		if (timesHierarchy.contains(level)) {
			return rollUp(sparkSession, graph, level, "dateTime", timesHierarchy);
		} else if (locationsHierarchy.contains(level)) {
			return rollUp(sparkSession, graph, level, "name", locationsHierarchy);
		} else if (operatorsHierarchy.contains(level)) {
			return rollUp(sparkSession, graph, level, "name", operatorsHierarchy);
		}
		throw new IllegalArgumentException("Unknown level: " + level);
	}

	private static GraphFrame rollUp(SparkSession sparkSession, GraphFrame graph, String level, String fieldName,
			List<String> hierarchy) {
		String bottom = hierarchy.get(0);
		GraphFrame newGraph = graph;
		for (int i = 1; i < hierarchy.size() && !hierarchy.get(i - 1).equals(level); i++) {
			String nextLevel = hierarchy.get(i);

			newGraph.triplets().createOrReplaceTempView("t_table");

			Dataset<Row> idPairs = sparkSession.sql("SELECT src.id as srcId, dst.id as dstId, edge.label as label FROM t_table WHERE src.type = '"
					+ bottom + "'" + " AND dst.type = '" + nextLevel + "'");
			idPairs.createOrReplaceTempView("id_pairs");
			
			Dataset<Row> newEdges = sparkSession
					.sql("SELECT t_table.src.id as src, COALESCE(v.dstId, t_table.dst.id) as dst, COALESCE(v.label, edge.label) as label "
							+ "FROM  t_table LEFT OUTER JOIN id_pairs v ON t_table.dst.id = v.srcId").distinct();

			newGraph.vertices().createOrReplaceTempView("v_table");
			Dataset<Row> newVertices = sparkSession.sql("SELECT * FROM v_table " + "WHERE type <> '" + bottom + "'");

			newGraph = GraphFrame.apply(newVertices, newEdges);
			bottom = nextLevel;
		}
		return newGraph;

		// String query = "SELECT MIN(id) as id, '" + level + "' as type, ";
		// String cols = vertexFields.stream().map(field -> {
		// if (field.equals(fieldName)) {
		// return fieldName;
		// }
		// return "NULL as " + field;
		// }).collect(Collectors.joining(", "));
		// query += cols;
		//
		// Dataset<Row> minVertices = sparkSession
		// .sql(query + " FROM v_table " + "WHERE type = '" + level + "' GROUP BY " +
		// fieldName);
		// minVertices.createOrReplaceTempView("v_min_table");
		// System.out.println(minVertices.count());
		//
		// Dataset<Row> otherVertices = sparkSession.sql("SELECT * FROM v_table " +
		// "WHERE type <> '" + level + "'");
		//
		// Dataset<Row> newVertices = otherVertices.union(minVertices);
		//
		// graph.edges().createOrReplaceTempView("e_table");
		// graph.triplets().createOrReplaceTempView("t_table");
		//
		// Dataset<Row> newEdges = sparkSession.sql(
		// "SELECT COALESCE(v1.id, t_table.src.id) as src, COALESCE(v2.id,
		// t_table.dst.id) as dst, edge.label as label "
		// + "FROM t_table FULL OUTER JOIN v_min_table v1 ON t_table.src." + fieldName +
		// " = v1."
		// + fieldName + " FULL OUTER JOIN v_min_table v2 ON t_table.dst." + fieldName +
		// "= v2."
		// + fieldName);
		//
		// return GraphFrame.apply(newVertices, newEdges);
	}
}
