# README

## Data generation

All data generation code is under project GraphDB. It requires having files cities.csv, countries.csv, first_names.csv, last_names.csv, and operators.csv. These files are:

- cities.csv -> Column city from table emisorreceptor
- countries.csv -> Column country from table emisorreceptor
- first_names.csv -> First argument of splitting by space (' ') column username from table emisorreceptor.
- last_names.csv -> Second argument of splitting by space (' ') column username from table emisorreceptor.
- operators.csv -> Column operator from table emisorreceptor

The class EmisorReceptorGenerator creates the data for the emisorreceptor table.
The variable USER_COUNT defines the amount of different users created by concatenating randomly first names with last names.
The variable PHONE_COUNT defines the amount of different phones created with the format [100-999]-[100-999]-[1000-9999].

The class CallMemberGenerator creates the data of the calls and the corresponding datetimes.
The variables MIN_CALL_NUM and MAX_CALL_NUM define the min and max amount of members for each call, and assumes a uniform distribution (both values included). MIN_DURATION and MAX_DURATION define the min and max duration of each call. EMISORRECEPTOR_COUNT is the amount of phones to pick from the emisorreceptor file. 

This class will create the create schema files for SQL and the call and datetime sql insert files.

## Data for the graphs

To insert data into the graph it is needed to export the SQL tables data to csv with the names emisorreceptor.csv, datetime.csv and call.csv . 

## Running queries in SQL - Setting the Schema to use

SET search_path TO <schema_name>

## Running GraphFrames (May not work after migration)

- Export jar from GraphDB project.
- Put jar to a cluster node.
- Add jar to hdfs.
- Add data csv files to hdfs.
- Run with: 
spark-submit --master spark://clusternode1:7077 --deploy-mode=cluster --class graphframes.GraphMain hdfs://clusternode1:8020/user/<path_to_jar_in_hdfs> hdfs://clusternode1:8020/user/<path_to_csv_files_dir_in_hdfs>

The path used was tcolloca/csv_tables/[test|v1|v2|v3] .

## Running JanusGraph

- Set classpath in cluster node: export CLASSPATH=$CLASSPATH:.:graph.jar:$JANUSGRAPH_HOME/lib/*
- Export jar from JanusOlap project with name graph.jar . 
- Put jar to cluster node. i.e: 
	$> sftp tcolloca@node2.it.itba.edu.ar
		$> put graph.jar
- Run with:
java ar.edu.itba.App <path>/<to>/<csv_files_dir> <query_name> [<print_ans>]

<query_name> = (1_[1-6]|2_1)[_not_olap] Examples: 1_1_not_olap, 2_1
<print_ans> = (true|false) 

The path used was /home/tcolloca/csv_tables/[test|v1|v2|v3]

where v1 has 100K calls, v2 has 300K calls and v3 has 715K calls.

Query name defines the query to run. Adding _not_olap will run the ad hoc version. 
If print_ans is set to true, it will print all the tuples of the answer of the query.







