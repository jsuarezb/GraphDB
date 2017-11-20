package graphframes;

import java.util.ArrayList;
import java.util.List;

import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SaveMode;
import org.apache.spark.sql.SparkSession;
import org.graphframes.GraphFrame;

public class GraphMain {

	private static List<String> locationsHierarchy = new ArrayList<>();
	private static List<String> timesHierarchy = new ArrayList<>();
	private static List<String> operatorsHierarchy = new ArrayList<>();

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		GraphFrame schemaGraph;
		GraphFrame dataGraph;
		
		String[] aux = args[0].split("/");
		String dataName = aux[aux.length - 1];
		
		try {
			Dataset<Row> schemaVertices = sparkSession.read().parquet("schema-verticesv2"+ dataName);
			Dataset<Row> schemaEdges = sparkSession.read().parquet("schema-edgesv2"+ dataName);
			
			Dataset<Row> dataVertices = sparkSession.read().parquet("data-verticesv2"+ dataName);
			Dataset<Row> dataEdges = sparkSession.read().parquet("data-edgesv2"+ dataName);
			
			schemaGraph = GraphFrame.apply(schemaVertices, schemaEdges);
			dataGraph = GraphFrame.apply(dataVertices, dataEdges);
		} catch (Throwable th) {
			schemaGraph = new SchemaGraph().buildGraph(sparkSession, sparkContext);
			dataGraph = new DataGraph(args[0]).buildGraph(sparkSession, sparkContext);
			
			schemaGraph.vertices().write().mode(SaveMode.Overwrite).parquet("schema-verticesv2" + dataName);
			schemaGraph.edges().write().mode(SaveMode.Overwrite).parquet("schema-edgesv2" + dataName);
			
			dataGraph.vertices().write().mode(SaveMode.Overwrite).parquet("data-verticesv2" + dataName);
			dataGraph.edges().write().mode(SaveMode.Overwrite).parquet("data-edgesv2" + dataName);
		}
		
		schemaGraph.vertices().show(1000);
		schemaGraph.edges().show(1000);
		
		dataGraph.vertices().show(1000);
		dataGraph.edges().show(1000);

		GraphFrame newGraph = climb(sparkSession, dataGraph, "phone", "city");
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);
		
		// MINIMIZACION
		
		newGraph.triplets().filter("edge.label = 'calledBy' OR edge.label = 'integratedBy'")
			.createOrReplaceTempView("call_triplets");
		
		sparkSession.conf().set("spark.sql.crossJoin.enabled", "true");
		
		sparkSession.sql("SELECT * FROM call_triplets").show(1000);
		
		dataGraph.vertices().filter("type = 'call'").select("id").createOrReplaceTempView("calls");
		
		Dataset<Row> rows = sparkSession.sql("SELECT c1.id AS c1Id, c2.id AS c2Id \n"
				+ "FROM calls c1, calls c2 \n"
				+ "WHERE (SELECT COUNT(*) FROM call_triplets c WHERE c.src.id = c1.id) = ( \n" 
				+ "		SELECT SUM(val) FROM (SELECT sqrt(COUNT(*)) as val \n"
				+ "		FROM call_triplets c3 JOIN call_triplets c4 \n"
				+ "			ON c3.edge.label = c4.edge.label \n"
				+ "			AND c3.dst.id = c4.dst.id \n"
				+ "		WHERE c3.src.id = c1.id \n"
				+ "		AND c4.src.id = c2.id \n"
				+ "		GROUP BY c3.dst.id, c4.dst.id, c3.edge.label \n"
				+ "))");
		rows.show(1000);
	}
	
	private static GraphFrame climb(SparkSession sparkSession, GraphFrame dataGraph, 
			String srcLevel, String dstLevel) {
		
		StringBuilder pathStr = new StringBuilder("[e0]");
		Dataset<Row> paths;
		int i = 1;
		while (true) {
			paths = dataGraph.find("(srcLevel)-" + pathStr.toString() + "->(dstLevel)")
					.filter("srcLevel.level = '" + srcLevel + "'")
					.filter("dstLevel.level = '" + dstLevel + "'");
			if (paths.count() > 0) {
				break;
			}
			pathStr.append(String.format("-> (v%d); (v%d)-[e%d]", i, i, i));
			i++;
		}
		System.out.println("(srcLevel)-" + pathStr.toString() + "->(dstLevel)");
		paths.createOrReplaceTempView("climb_paths");
	
		dataGraph.vertices().filter("type = '" + srcLevel + "'").createOrReplaceTempView("bottoms");
		Dataset<Row> otherVertices = dataGraph.vertices().filter("type <> '" + srcLevel + "'");
		
		sparkSession.sql("SELECT b.id AS id, p.dstLevel.value AS dstLevelValue \n"
				+ "FROM climb_paths p, bottoms b \n"
				+ "WHERE b.value = p.srcLevel.value \n"
				+ "").createOrReplaceTempView("climbed_bottoms");
		
		Dataset<Row> newPhones = sparkSession.sql("SELECT MIN(id) AS id, '" + dstLevel + "' AS type, NULL AS label, \n"
				+ "NULL AS level, dstLevelValue AS value, NULL AS duration \n"
				+ "FROM climbed_bottoms \n"
				+ "GROUP BY dstLevelValue");
		newPhones.createOrReplaceTempView("climbed_bottoms_ids");
		
		dataGraph.edges().createOrReplaceTempView("edges");
		Dataset<Row> otherEdges = dataGraph.edges().filter("label <> 'calledBy' AND label <> 'integratedBy'");
		
		Dataset<Row> newEdges = sparkSession.sql("SELECT edges.src AS src, climbed_bottoms_ids.id AS dst, edges.label \n"
		 		+ "FROM climbed_bottoms, edges, climbed_bottoms_ids \n"
		 		+ "WHERE climbed_bottoms_ids.value = climbed_bottoms.dstLevelValue \n"
		 		+ "AND climbed_bottoms.id = edges.dst");
		
		return GraphFrame.apply(newPhones.union(otherVertices), newEdges.union(otherEdges));
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
