package testing;


import java.util.ArrayList; 
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.spark.api.java.JavaSparkContext;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SQLContext;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;
import org.graphframes.GraphFrame;



public class TP08Ex6
{

	private static Dataset<Row> populateVerticesForGraphFrames(JavaSparkContext JSPContext)
	{
		
		 // metadata
		 List<StructField> vertFields = new ArrayList<StructField>();
		 vertFields.add(DataTypes.createStructField("id",DataTypes.LongType, true));
		 vertFields.add(DataTypes.createStructField("URL",DataTypes.StringType, true));
		 vertFields.add(DataTypes.createStructField("owner",DataTypes.StringType, true));
		 vertFields.add(DataTypes.createStructField("creationDate",DataTypes.DateType, true));
		 
		 StructType vertSchema = DataTypes.createStructType(vertFields);
		 
		 // values
		 ArrayList<Row> vertList = new ArrayList<Row>();
		 
		vertList.add(RowFactory.create(10L, "10.html", "John", new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(20L, "20.html", "Mary", new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(25L, "25.html", "John", new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(30L, "30.html", "John", new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(40L, "40.html", "Mary", new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(50L, "50.html", "Xen",  new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(60L, "60.html", "John", new java.sql.Date( new GregorianCalendar(2017, 05,18).getTimeInMillis() )) );
		vertList.add(RowFactory.create(70L, "70.html", "Xen",  new java.sql.Date( new GregorianCalendar(2017, 05,22).getTimeInMillis() )) );
		vertList.add(RowFactory.create(77L, "77.html", "Xen",  new java.sql.Date( new GregorianCalendar(2016, 05,10).getTimeInMillis() )) );
		vertList.add(RowFactory.create(80L, "80.html", "Xen",  new java.sql.Date( new GregorianCalendar(2017, 05,17).getTimeInMillis() )) );
		vertList.add(RowFactory.create(90L, "90.html", "Xen",  new java.sql.Date( new GregorianCalendar(2017, 05,10).getTimeInMillis() )) );
				
		 // association of both of them
		 SQLContext sqlContext = new org.apache.spark.sql.SQLContext(JSPContext);
		 Dataset<Row> verticesDF = sqlContext.createDataFrame(JSPContext.parallelize(vertList) , vertSchema);
		 
		 return verticesDF;
	}
	
	
	private static Dataset<Row> populateEdgesForGraphFrames(JavaSparkContext JSPContext)
	{
		
		 // metadata
		 List<StructField> edgeFields = new ArrayList<StructField>();
		 edgeFields.add(DataTypes.createStructField("src",DataTypes.LongType, true));
		 edgeFields.add(DataTypes.createStructField("dst",DataTypes.LongType, true));
		 edgeFields.add(DataTypes.createStructField("label",DataTypes.StringType, true));
		 edgeFields.add(DataTypes.createStructField("count",DataTypes.IntegerType, true));
		 
		 StructType edgeSchema = DataTypes.createStructType(edgeFields);
		 
		 // values
		 ArrayList<Row> edgeList = new ArrayList<Row>();
		 
		edgeList.add(RowFactory.create(70L, 50L, "refersTo", 11) );
		edgeList.add(RowFactory.create(25L, 10L, "refersTo",  2) );
		edgeList.add(RowFactory.create(25L, 50L, "refersTo",  2) );
		edgeList.add(RowFactory.create(50L, 10L, "refersTo",  2) );	
		edgeList.add(RowFactory.create(60L, 90L, "refersTo",  3) );
		edgeList.add(RowFactory.create(77L, 40L, "refersTo", 11) );
		edgeList.add(RowFactory.create(40L, 20L, "refersTo",  1) );
		edgeList.add(RowFactory.create(40L, 30L, "refersTo",  1) );
		edgeList.add(RowFactory.create(30L, 20L, "refersTo",  1) );
		edgeList.add(RowFactory.create(20L, 77L, "refersTo",  3) );
		
		 // association of both of them
		 SQLContext sqlContext = new org.apache.spark.sql.SQLContext(JSPContext);
		 Dataset<Row> edgesDF = sqlContext.createDataFrame(JSPContext.parallelize(edgeList) , edgeSchema);
		 
		 return edgesDF;
	}
	
	
	public static void main(String[] args) 
	{
		SparkSession sp = SparkSession
				  .builder()
				  .appName("GraphFrame TP08Ex6")
				  .getOrCreate();
		 JavaSparkContext JSPContext = new JavaSparkContext(sp.sparkContext());
		 SQLContext sqlContext = new org.apache.spark.sql.SQLContext(JSPContext);

		 
		 Dataset<Row> verticesDF = populateVerticesForGraphFrames(JSPContext);
		 Dataset<Row> edgesDF = populateEdgesForGraphFrames(JSPContext);
		
		 GraphFrame myGraph = GraphFrame.apply(verticesDF, edgesDF);
		 myGraph.vertices().createOrReplaceTempView("v_table");
		 
		 Dataset<Row> newVerticesDF= sqlContext.sql("SELECT id, URL, owner, year(creationDate) from v_table");
		 GraphFrame newGraph = GraphFrame.apply(newVerticesDF, edgesDF);
		 
		 
		 // in the driver
		System.out.println("newGraph:");
		newGraph.vertices().show();
		System.out.println();
		newGraph.edges().show();
		
		newGraph.vertices().printSchema();
		newGraph.edges().printSchema();
		 sp.close();
	}
	
	
	

}