package graphframes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;
import org.graphframes.GraphFrame;

public class SchemaGraph {

	private long id = 1L;
	
	private ArrayList<Row> vertices = new ArrayList<Row>();
	private ArrayList<Row> edges = new ArrayList<Row>();

	public GraphFrame buildGraph(SparkSession sparkSession, JavaSparkContext sparkContext) {
		newDimension("Times", Arrays.asList("timestamp", "day", "month", "year"));
		newDimension("Locations", Arrays.asList("phone", "user", "city", "country"));
		newDimension("Operators", Arrays.asList("phone", "operator"));
		
		StructType verticesSchema = buildVerticesSchema();
		StructType edgesSchema = buildEdgesSchema();

		Dataset<Row> verticesDataset = sparkSession.createDataFrame(sparkContext.parallelize(vertices),
				verticesSchema);
		Dataset<Row> edgesDataset = sparkSession.createDataFrame(sparkContext.parallelize(edges),
				edgesSchema);
		
		return GraphFrame.apply(verticesDataset, edgesDataset);
	}
	
	private void newDimension(String dimension, List<String> levels) {
		vertices.add(RowFactory.create(id, "schema", dimension, "all"));
		long parentId = id++;
		Collections.reverse(levels);
		for (String level : levels) {
			parentId = newLevel(dimension, level, parentId);
		}
	}
	
	private long newLevel(String dimension, String level, long parentId) {
		vertices.add(RowFactory.create(id, "schema", dimension, level));
		edges.add(RowFactory.create(id, parentId, "subLevelOf"));
		return id++;
	}
	
	private static StructType buildVerticesSchema() {
		List<StructField> verticesFields = new ArrayList<StructField>();
		verticesFields.add(DataTypes.createStructField("id", DataTypes.LongType, true));
		verticesFields.add(DataTypes.createStructField("type", DataTypes.StringType, true));
		
		// Schema
		verticesFields.add(DataTypes.createStructField("label", DataTypes.StringType, true));
		verticesFields.add(DataTypes.createStructField("level", DataTypes.StringType, true));
		
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
