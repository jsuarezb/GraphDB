package testing;


import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.graphx.Edge;
import org.apache.spark.graphx.Graph;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.storage.StorageLevel;

import helper.EdgeProp;
import helper.NewVertexProp;
import helper.VertexProp;
import scala.Tuple2;

public class TP08Ex1
{

	private static  JavaRDD<Tuple2<Object,VertexProp>> populateVerticesForGraphImpl(JavaSparkContext JSPContext)
	{
		 List<Tuple2<Object, VertexProp>> vertList= new ArrayList<Tuple2<Object, VertexProp>>();
		 
		vertList.add(Tuple2.apply(10L,  VertexProp.apply("10.html", "John", new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(20L,  VertexProp.apply("20.html", "Mary", new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(25L,  VertexProp.apply("25.html", "John", new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(30L,  VertexProp.apply("30.html", "John", new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(40L,  VertexProp.apply("40.html", "Mary", new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(50L,  VertexProp.apply("50.html", "Xen",  new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(60L,  VertexProp.apply("60.html", "John", new GregorianCalendar(2017, 05,18))) );
		vertList.add(Tuple2.apply(70L,  VertexProp.apply("70.html", "Xen",  new GregorianCalendar(2017, 05,22))) );
		vertList.add(Tuple2.apply(77L,  VertexProp.apply("77.html", "Xen",  new GregorianCalendar(2016, 05,10))) );
		vertList.add(Tuple2.apply(80L,  VertexProp.apply("80.html", "Xen",  new GregorianCalendar(2017, 05,17))) );
		vertList.add(Tuple2.apply(90L,  VertexProp.apply("90.html", "Xen",  new GregorianCalendar(2017, 05,10))) );
				
		 JavaRDD<Tuple2<Object, VertexProp>> verticesRDD = JSPContext.parallelize(vertList);

		 return verticesRDD;
	}
	
	private static JavaRDD<Edge<EdgeProp>> populateEdgesForGraphImpl(JavaSparkContext JSPContext)
	{
		List<Edge<EdgeProp>> edgeList = new ArrayList<Edge<EdgeProp>>();
		
		edgeList.add(Edge.apply(70L, 50L, EdgeProp.apply("refersTo", 11)) );
		edgeList.add(Edge.apply(25L, 10L, EdgeProp.apply("refersTo",  2)) );
		edgeList.add(Edge.apply(25L, 50L, EdgeProp.apply("refersTo",  2)) );
		edgeList.add(Edge.apply(50L, 10L, EdgeProp.apply("refersTo",  2)) );	
		edgeList.add(Edge.apply(60L, 90L, EdgeProp.apply("refersTo",  3)) );
		edgeList.add(Edge.apply(77L, 40L, EdgeProp.apply("refersTo", 11)) );
		edgeList.add(Edge.apply(40L, 20L, EdgeProp.apply("refersTo",  1)) );
		edgeList.add(Edge.apply(40L, 30L, EdgeProp.apply("refersTo",  1)) );
		edgeList.add(Edge.apply(30L, 20L, EdgeProp.apply("refersTo",  1)) );
		edgeList.add(Edge.apply(20L, 77L, EdgeProp.apply("refersTo",  3)) );
		
			 
		 JavaRDD<Edge<EdgeProp>> edgesRDD = JSPContext.parallelize(edgeList);

		 return edgesRDD;
	}
	

	
	public static void main(String[] args) 
	{
		SparkSession sp = SparkSession
				  .builder()
				  .appName("GraphX TP08-Ex1")
				  .getOrCreate();
		 JavaSparkContext JSPContext = new JavaSparkContext(sp.sparkContext());
		 
		 JavaRDD<Tuple2<Object, VertexProp>> vRDD = populateVerticesForGraphImpl(JSPContext);
		 JavaRDD<Edge<EdgeProp>> eRDD = populateEdgesForGraphImpl(JSPContext);
		
  
		 Graph<VertexProp, EdgeProp> myGraph = 	Graph.apply(
					vRDD.rdd(), 
					eRDD.rdd(), 
					null, 
					StorageLevel.MEMORY_ONLY(),
					StorageLevel.MEMORY_ONLY(), 
					scala.reflect.ClassTag$.MODULE$.apply(VertexProp.class), 
					scala.reflect.ClassTag$.MODULE$.apply(EdgeProp.class) );

		Graph<NewVertexProp, EdgeProp> newGraph = myGraph.mapVertices(
				new scala.runtime.AbstractFunction2<Object, VertexProp, NewVertexProp>() 
				{
					public NewVertexProp apply(Object arg0, VertexProp arg1) 
					{
						return NewVertexProp.apply(arg1.getURL(), arg1.owner(), 
								arg1.getDate().get(GregorianCalendar.YEAR) );
					}
				},
			scala.reflect.ClassTag$.MODULE$.apply(NewVertexProp.class),
				null
				);
				
		
		// in the driver
		System.out.println("New graph:");
		newGraph.vertices().toJavaRDD().collect().forEach(System.out::println);
		System.out.println();
		newGraph.edges().toJavaRDD().collect().forEach(System.out::println);
		
		 sp.close();
	}
	
	
	

}