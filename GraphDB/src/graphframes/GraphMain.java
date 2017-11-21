package graphframes;

import java.text.NumberFormat;

import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SaveMode;
import org.apache.spark.sql.SparkSession;
import org.graphframes.GraphFrame;

public class GraphMain {

	public static void main(String[] args) {
		SparkSession sparkSession = SparkSession.builder().appName("TPE - Grupo 2").getOrCreate();
		JavaSparkContext sparkContext = new JavaSparkContext(sparkSession.sparkContext());

		sparkContext.setCheckpointDir("cache-g2");
		
		GraphFrame schemaGraph;
		GraphFrame dataGraph;
		
		String[] aux = args[0].split("/");
		String dataName = aux[aux.length - 1];
		
		try {
			Dataset<Row> schemaVertices = sparkSession.read().parquet("schema-verticesv3"+ dataName);
			Dataset<Row> schemaEdges = sparkSession.read().parquet("schema-edgesv3"+ dataName);
			
			Dataset<Row> dataVertices = sparkSession.read().parquet("data-verticesv3"+ dataName);
			Dataset<Row> dataEdges = sparkSession.read().parquet("data-edgesv3"+ dataName);
			
			schemaGraph = GraphFrame.apply(schemaVertices, schemaEdges);
			dataGraph = GraphFrame.apply(dataVertices, dataEdges).cache();
		} catch (Throwable th) {
			schemaGraph = new SchemaGraph().buildGraph(sparkSession, sparkContext);
			dataGraph = new DataGraph(args[0]).buildGraph(sparkSession, sparkContext).cache();
			
			schemaGraph.vertices().write().mode(SaveMode.Overwrite).parquet("schema-verticesv3" + dataName);
			schemaGraph.edges().write().mode(SaveMode.Overwrite).parquet("schema-edgesv3" + dataName);
			
			dataGraph.vertices().write().mode(SaveMode.Overwrite).parquet("data-verticesv3" + dataName);
			dataGraph.edges().write().mode(SaveMode.Overwrite).parquet("data-edgesv3" + dataName);
		}
		
		dataGraph.vertices().show(1000);
		dataGraph.edges().show(1000);

		GraphFrame newGraph = climb(sparkSession, dataGraph, "phone", "allLocations");
		GraphFrame auxGraph = newGraph;
		dataGraph.unpersist();
		
		newGraph = climb(sparkSession, newGraph, "timestamp", "month");
		
		auxGraph.unpersist();
		auxGraph = newGraph;
		
		// TODO: CHANGE TO NEWGRAPH
		newGraph = minimize(sparkSession, newGraph);
		
		auxGraph.unpersist();
		auxGraph = newGraph;
		
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);
		
		newGraph = climb(sparkSession, newGraph, "month", "allTimes");
		
		auxGraph.unpersist();
		auxGraph = newGraph;
		
		newGraph = minimize(sparkSession, newGraph);
		
		newGraph.vertices().show(1000);
		newGraph.edges().show(1000);
		
		auxGraph.unpersist();
		auxGraph = newGraph;
		
		auxGraph.unpersist();
	}
	
	private static GraphFrame climb(SparkSession sparkSession, GraphFrame dataGraph, 
			String srcLevel, String dstLevel) {
		
		StringBuilder pathStr = new StringBuilder("[e0]");
		Dataset<Row> paths;
		int i = 1;
		System.out.println("srcLevel.level = '" + srcLevel + "'");
		System.out.println("dstLevel.level = '" + dstLevel + "'");
		dataGraph.vertices().filter("level = '" + srcLevel + "'").show(100);
		dataGraph.vertices().filter("level = '" + dstLevel + "'").show(100);
		while (true) {
			printMemory();
			System.out.println("(srcLevel)-" + pathStr.toString() + "->(dstLevel)");
			paths = dataGraph.find("(srcLevel)-" + pathStr.toString() + "->(dstLevel)")
					.filter("srcLevel.level = '" + srcLevel + "'")
					.filter("dstLevel.level = '" + dstLevel + "'");
			if (paths.count() > 0) {
				break;
			}
			pathStr.append(String.format("-> (v%d); (v%d)-[e%d]", i, i, i));
			i++;
		}
		paths.cache().createOrReplaceTempView("climb_paths");
	
		Dataset<Row> bottoms = dataGraph.vertices().filter("type = '" + srcLevel + "'");
		bottoms.createOrReplaceTempView("bottoms");
		
		Dataset<Row> climbed_bottoms = sparkSession.sql("SELECT b.id AS id, p.dstLevel.value AS dstLevelValue \n"
				+ "FROM climb_paths p, bottoms b \n"
				+ "WHERE b.value = p.srcLevel.value \n"
				+ "").cache();
		climbed_bottoms.createOrReplaceTempView("climbed_bottoms");

		paths.unpersist();
		
		Dataset<Row> newPhones = sparkSession.sql("SELECT MIN(id) AS id, '" + dstLevel + "' AS type, NULL AS label, \n"
				+ "NULL AS level, dstLevelValue AS value, NULL AS duration \n"
				+ "FROM climbed_bottoms \n"
				+ "GROUP BY dstLevelValue").cache();
		newPhones.createOrReplaceTempView("climbed_bottoms_ids");
		
		Dataset<Row> triplets = dataGraph.triplets().filter("src.type = 'call'").select("edge");
		triplets.createOrReplaceTempView("triplets");
		
		Dataset<Row> newEdges = sparkSession.sql("SELECT t.edge.src AS src, climbed_bottoms_ids.id AS dst, t.edge.label as label \n"
		 		+ "FROM climbed_bottoms, triplets as t, climbed_bottoms_ids \n"
		 		+ "WHERE climbed_bottoms_ids.value = climbed_bottoms.dstLevelValue \n"
		 		+ "AND climbed_bottoms.id = t.edge.dst").cache();

		climbed_bottoms.unpersist();
		
		newEdges.select("label").createOrReplaceTempView("new_edge_labels");
		
		dataGraph.edges().createOrReplaceTempView("edges");
		Dataset<Row> otherEdges = sparkSession.sql("SELECT * FROM edges e \n"
				+ "WHERE e.label NOT IN (SELECT * FROM new_edge_labels)");
		
		Dataset<Row> otherVertices = dataGraph.vertices().filter("type <> '" + srcLevel + "'");
		
		GraphFrame newGraph = GraphFrame.apply(newPhones.union(otherVertices), newEdges.union(otherEdges));

		newPhones.unpersist();
		newEdges.unpersist();
		
		return newGraph.cache();
	}
	
	private static GraphFrame minimize(SparkSession sparkSession, GraphFrame graph) {
		sparkSession.conf().set("spark.sql.crossJoin.enabled", "true");

		Dataset<Row> callTriplets = graph.triplets()
				.filter("edge.label = 'calledBy' OR edge.label = 'integratedBy' OR edge.label = 'atTime'");
		callTriplets.createOrReplaceTempView("call_triplets");
	
		Dataset<Row> calls = graph.vertices().filter("type = 'call'").cache();
		calls.createOrReplaceTempView("calls");
		
		Dataset<Row> outDegrees = sparkSession.sql("SELECT c.src.id AS src, c.edge.label AS label, \n"
				+ "c.dst.id AS dst, COUNT(*) AS count \n"
				+ "		  FROM call_triplets c \n"
				+ "		  GROUP BY c.src.id, c.edge.label, c.dst.id")
				.cache();
		outDegrees.createOrReplaceTempView("out_degrees");
		
		Dataset<Row> outMatches = sparkSession.sql("SELECT o1.src AS c1, o2.src AS c2, COUNT(*) AS count \n"
				+ "FROM out_degrees o1 JOIN out_degrees o2 \n"
				+ "ON o1.label = o2.label AND o1.dst = o2.dst AND o1.count = o2.count \n"
				+ "GROUP BY o1.src, o2.src");
		outMatches.createOrReplaceTempView("out_matches");
		
		Dataset<Row> outCount = sparkSession.sql("SELECT o1.src AS c, COUNT(*) AS count \n"
				+ "FROM out_degrees o1 \n"
				+ "GROUP BY o1.src");
		outCount.createOrReplaceTempView("out_count");
		
		outDegrees.unpersist();
		
		Dataset<Row> eqCalls = sparkSession.sql("SELECT o1.c1 AS c1, o1.c2 AS c2 \n"
				+ "FROM out_matches o1 JOIN out_count o2 \n"
				+ "ON o1.c1 = o2.c AND o1.count = o2.count")
				.cache();
		eqCalls.createOrReplaceTempView("eq_calls");
		
		Dataset<Row> durations = sparkSession.sql("SELECT c.id AS id, c.duration AS duration, MIN(p.c2) as minId \n"
				+ "FROM eq_calls p JOIN calls c \n"
				+ "ON p.c1 = c.id \n"
				+ "GROUP BY c.id, c.duration")
				.cache();
		durations.createOrReplaceTempView("durations");
		
		eqCalls.unpersist();
		calls.unpersist();
		
		Dataset<Row> explodedDurations = sparkSession.sql("SELECT d.minId AS minId, \n"
				+ "explode(d.duration) AS duration \n"
				+ "FROM durations d \n")
				.cache();
		explodedDurations.createOrReplaceTempView("exploded_durations");
				
		sparkSession.sql("SELECT d.minId AS id, \n"
				+ "split(concat_ws(',', collect_list(concat_ws(',', CAST(d.duration AS string)))), ',') AS duration \n"
				+ "FROM exploded_durations d \n"
				+ "GROUP BY d.minId")
				.createOrReplaceTempView("exploded_durations_aux");
		
		sparkSession.sql("SELECT d.id AS id, \n"
				+ "explode(d.duration) AS duration \n"
				+ "FROM exploded_durations_aux d")
				.createOrReplaceTempView("exploded_new_durations");
		
		Dataset<Row> newCallNodes = sparkSession.sql("SELECT d.id AS id, 'call' AS type, NULL AS label, \n"
				+ "NULL AS level, NULL AS value, \n"
				+ "collect_list(CAST(d.duration AS integer)) AS duration \n"
				+ "FROM exploded_new_durations d \n"
				+ "GROUP BY d.id")
				.cache();

		explodedDurations.unpersist();
		
		Dataset<Row> triplets = graph.triplets().filter("src.type = 'call'");
		triplets.createOrReplaceTempView("triplets");
		
		Dataset<Row> newEdges = sparkSession.sql("SELECT d.minId AS src, t.dst.id AS dst, t.edge.label AS label \n"
		 		+ "FROM durations d JOIN triplets t \n"
		 		+ "ON d.id = t.src.id")
				.cache();
		
		durations.unpersist();

		newEdges.select("label").createOrReplaceTempView("new_edge_labels");
		
		Dataset<Row> otherVertices = graph.vertices().filter("type <> 'call'");
		
		graph.edges().createOrReplaceTempView("edges");
		Dataset<Row> otherEdges = sparkSession.sql("SELECT * FROM edges e \n"
				+ "WHERE e.label NOT IN (SELECT * FROM new_edge_labels)");
		
		GraphFrame newGraph = GraphFrame.apply(newCallNodes.union(otherVertices), newEdges.union(otherEdges));

		newCallNodes.unpersist();
		newEdges.unpersist();
		
		return newGraph.cache();
	}
	
	private static void printMemory() {
		Runtime runtime = Runtime.getRuntime();

		NumberFormat format = NumberFormat.getInstance();

		StringBuilder sb = new StringBuilder();
		long maxMemory = runtime.maxMemory();
		long allocatedMemory = runtime.totalMemory();
		long freeMemory = runtime.freeMemory();

		sb.append("free memory: " + format.format(freeMemory / 1024) + "\n");
		sb.append("allocated memory: " + format.format(allocatedMemory / 1024) + "\n");
		sb.append("max memory: " + format.format(maxMemory / 1024) + "\n");
		sb.append("total free memory: " + format.format((freeMemory + (maxMemory - allocatedMemory)) / 1024) + "\n");
		
		System.out.println(sb.toString());
	}
}
