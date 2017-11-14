package graphframes;

import java.util.ArrayList;
import java.util.List;

import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.graphframes.GraphFrame;

public class GraphMain {

	private static List<String> locationsHierarchy = new ArrayList<>();
	private static List<String> timesHierarchy = new ArrayList<>();
	private static List<String> operatorsHierarchy = new ArrayList<>();

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		GraphFrame schemaGraph = new SchemaGraph().buildGraph(sparkSession, sparkContext);
		GraphFrame dataGraph = new DataGraph(args[0]).buildGraph(sparkSession, sparkContext);
		
		schemaGraph.vertices().show(1000);
		schemaGraph.edges().show(1000);
		
		dataGraph.vertices().show(1000);
		dataGraph.edges().show(1000);
		
		dataGraph.find("(phone)-[e1]->(user); (user)-[e2]->(city)")
			.filter("city.level = 'city'")
			.createOrReplaceTempView("rollup_paths");
		
		dataGraph.vertices().filter("type = 'phone'").createOrReplaceTempView("phones");
		Dataset<Row> otherVertices = dataGraph.vertices().filter("type <> 'phone'");
		
		sparkSession.sql("SELECT p.id as id, r.city.value as city "
				+ "FROM rollup_paths r, phones p "
				+ "WHERE p.value = r.phone.value"
				+ "").createOrReplaceTempView("climbed_phones");
		
		Dataset<Row> newPhones = sparkSession.sql("SELECT MIN(id) as id, 'city' AS type, NULL, NULL, city, NULL, NULL "
				+ "FROM climbed_phones "
				+ "GROUP BY city");
		newPhones.createOrReplaceTempView("climbed_phones_ids");
		
		dataGraph.edges().createOrReplaceTempView("edges");
		Dataset<Row> otherEdges = dataGraph.edges().filter("label <> 'calledBy' AND label <> 'integratedBy'");
		
		Dataset<Row> newEdges = sparkSession.sql("SELECT edges.src AS src, climbed_phones_ids.id AS dst, edges.label "
		 		+ "FROM climbed_phones, edges, climbed_phones_ids "
		 		+ "WHERE climbed_phones_ids.city = climbed_phones.city "
		 		+ "AND climbed_phones.id = edges.dst");
		
		GraphFrame newGraph = GraphFrame.apply(newPhones.union(otherVertices), newEdges.union(otherEdges));
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);

//		GraphFrame newGraph = rollUp(sparkSession, graph, "day");
//		newGraph.vertices().show(1000);
//		newGraph.edges().show(1000);
//
//		newGraph = rollUp(sparkSession, graph, "city");
//		newGraph.vertices().show(1000);
//		newGraph.edges().show(1000);
//
//		newGraph = rollUp(sparkSession, graph, "operator");
//		newGraph.vertices().show(1000);
//		newGraph.edges().show(1000);
//
//		newGraph = rollUp(sparkSession, graph, "phone");
//		newGraph.vertices().show(1000);
//		newGraph.edges().show(1000);
//		
//		newGraph = rollUp(sparkSession, graph, "allTimes");
//		newGraph.vertices().show(1000);
//		newGraph.edges().show(1000);
		// rollUp(sparkSession, graph, "city", "name");
		// rollUp(sparkSession, graph, "operator", "name");
		// rollUp(sparkSession, graph, "phone", "phoneNumber");
	}

//	private static GraphFrame max(SparkSession sparkSession, GraphFrame graph, String level) {
//		return agg(sparkSession, graph, level, "MAX");
//	}
//	
//	private static GraphFrame avg(SparkSession sparkSession, GraphFrame graph, String level) {
//		return agg(sparkSession, graph, level, "AVG");
//	}
//	
//	private static GraphFrame count(SparkSession sparkSession, GraphFrame graph, String level) {
//		return agg(sparkSession, graph, level, "COUNT");
//	}
//	
//	private static GraphFrame agg(SparkSession sparkSession, GraphFrame graph, String level, String agg) {
//		GraphFrame newGraph = rollUp(sparkSession, graph, level);
//		newGraph.vertices().createOrReplaceTempView("v_table");
//		
//		return null;
//	}

//	private static GraphFrame rollUp(SparkSession sparkSession, GraphFrame graph, String level) {
//		if (timesHierarchy.contains(level)) {
//			return rollUp(sparkSession, graph, level, "dateTime", timesHierarchy);
//		} else if (locationsHierarchy.contains(level)) {
//			return rollUp(sparkSession, graph, level, "name", locationsHierarchy);
//		} else if (operatorsHierarchy.contains(level)) {
//			return rollUp(sparkSession, graph, level, "name", operatorsHierarchy);
//		}
//		throw new IllegalArgumentException("Unknown level: " + level);
//	}
//	
//	private static GraphFrame rollUpLocation(SparkSession sparkSession, GraphFrame schemaGraph, GraphFrame graph, String level) {
//		GraphFrame newGraph = graph;
//		String bottom = "phone";
//		
//		newGraph.triplets().filter("src.type = schemaInstance").createTempView("schema_instance_triplets");
//		Dataset<Row> idPairs = sparkSession
//		for (int i = 1; i < hierarchy.size() && !hierarchy.get(i - 1).equals(level); i++) {
//			String nextLevel = hierarchy.get(i);
//
//			newGraph.triplets().createOrReplaceTempView("t_table");
//
//			Dataset<Row> idPairs = sparkSession.sql("SELECT src.id as srcId, dst.id as dstId, edge.label as label FROM t_table WHERE "
//					+ "src.type = schemaInstance" 
//					+ "ANY (src.type) = '" + bottom + "'" + " dst.type = '" + nextLevel + "'");
//			idPairs.createOrReplaceTempView("id_pairs");
//			
//			Dataset<Row> newEdges = sparkSession
//					.sql("SELECT t_table.src.id as src, COALESCE(v.dstId, t_table.dst.id) as dst, COALESCE(v.label, edge.label) as label "
//							+ "FROM  t_table LEFT OUTER JOIN id_pairs v ON t_table.dst.id = v.srcId").distinct();
//
//			newGraph.vertices().createOrReplaceTempView("v_table");
//			Dataset<Row> newVertices = sparkSession.sql("SELECT * FROM v_table " + "WHERE type <> '" + bottom + "'");
//
//			newGraph = GraphFrame.apply(newVertices, newEdges);
//			bottom = nextLevel;
//		}
//		return newGraph;

//	private static GraphFrame rollUp(SparkSession sparkSession, GraphFrame graph, String level, String fieldName,
//			List<String> hierarchy) {
//		String bottom = hierarchy.get(0);
//		GraphFrame newGraph = graph;
//		for (int i = 1; i < hierarchy.size() && !hierarchy.get(i - 1).equals(level); i++) {
//			String nextLevel = hierarchy.get(i);
//
//			newGraph.triplets().createOrReplaceTempView("t_table");
//
//			Dataset<Row> idPairs = sparkSession.sql("SELECT src.id as srcId, dst.id as dstId, edge.label as label FROM t_table WHERE src.type = '"
//					+ bottom + "'" + " AND dst.type = '" + nextLevel + "'");
//			idPairs.createOrReplaceTempView("id_pairs");
//			
//			Dataset<Row> newEdges = sparkSession
//					.sql("SELECT t_table.src.id as src, COALESCE(v.dstId, t_table.dst.id) as dst, COALESCE(v.label, edge.label) as label "
//							+ "FROM  t_table LEFT OUTER JOIN id_pairs v ON t_table.dst.id = v.srcId").distinct();
//
//			newGraph.vertices().createOrReplaceTempView("v_table");
//			Dataset<Row> newVertices = sparkSession.sql("SELECT * FROM v_table " + "WHERE type <> '" + bottom + "'");
//
//			newGraph = GraphFrame.apply(newVertices, newEdges);
//			bottom = nextLevel;
//		}
//		return newGraph;
//	}

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
//	}
}
