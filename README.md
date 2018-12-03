# README

## Project Structure

GraphDB project contains the data generator code.
JanusGraph project contains the corresponding queries for both TPE and final exam.

`runs_data` contains the data used to generate time results for the final exam.

`lib/sql_queries` contains the PostgreSQL queries.

`lib/sql_queries/script.cmd` runs the different queries for the different datasets for PostgreSQL.

`lib/csv_tables` was used as an auxiliary output path of the Java data generators.

`lib/csv_tables/test` contains the test graph for TPE in csv format.

`lib/csv_tables/test_v2` contains the test graph for the final exam in csv 
format.

`lib/data_test.sql` contains the SQL commands to create the test schema (
final exam).

`lib/export.sql` exports PostgreSQL tables to csv (v1 - v8).

`lib/script.sh` runs the different queries for the different datasets in JanusGraph (both ad-hoc and Floyd-Warshall).

## Data generation

All data generation code is under project `GraphDB`. It requires having files `cities.csv`, `countries.csv`, `first_names.csv`, `last_names.csv`, and `operators.csv`. These files are:

- `cities.csv` -> Column city from table emisorreceptor
- `countries.csv` -> Column country from table emisorreceptor
- `first_names.csv` -> First argument of splitting by space (' ') column username from table emisorreceptor.
- `last_names.csv` -> Second argument of splitting by space (' ') column username from table emisorreceptor.
- `operators.csv` -> Column operator from table emisorreceptor

The class `EmisorReceptorGenerator` creates the data for the `EmisorReceptor` table.
The variable `USER_COUNT` defines the amount of different users created by concatenating randomly first names with last names.
The variable `PHONE_COUNT` defines the amount of different phones created with the format [100-999]-[100-999]-[1000-9999].

The class `CallMemberGenerator` creates the data of the calls and the corresponding datetimes.
The variables `MIN_CALL_NUM` and `MAX_CALL_NUM` define the min and max amount of members for each call, and assumes a uniform distribution (both values included). `MIN_DURATION` and `MAX_DURATION` define the min and max duration of each call. `EMISORRECEPTOR_COUNT` is the amount of phones to pick from the emisorreceptor file. 

This class will create the create schema files for SQL and the call and datetime sql insert files (`data<#calls>.sql`).

## Data for the graphs

To insert data into the graph it is needed to export the SQL tables data to csv with the names `emisorreceptor.csv`, `datetime.csv` and `call.csv`. 


## Running queries in SQL - Setting the Schema to use

```
SET search_path TO <schema_name>
```
## Running GraphFrames (May not work after migration)

- Export jar from GraphDB project.
- Put jar to a cluster node.
- Add jar to hdfs.
- Add data csv files to hdfs.
- Run with: 
```
spark-submit --master spark://clusternode1:7077 --deploy-mode=cluster
 --class graphframes.GraphMain hdfs://clusternode1:8020/
 user/path_to_jar_in_hdfs hdfs://clusternode1:8020/
 user/path_to_csv_files_dir_in_hdfs
```

The path used was `tcolloca/csv_tables/[test|v1|v2|v3]`.

## Running JanusGraph

- Set classpath in cluster node: 
```
export CLASSPATH=$CLASSPATH:.:graph.jar:$JANUSGRAPH_HOME/lib/*
```
- Export jar from JanusOlap project with name `graph.jar`. 
- Put jar to cluster node. i.e: 
```
	$> sftp tcolloca@node2.it.itba.edu.ar
		$> put graph.jar
```
- Run with:

```
java ar.edu.itba.App {path/to/csv_files_dir} {query_name} [{print_ans}]

```

```
{query_name} = (1_[1-6]|2_1)[_not_olap]|(final_2_(a|b|c|d)[_other]) \
       [{user} {threshold}]
```

```
{print_ans} = (true|false) 
```

Query name defines the query to run. 

Adding `_not_olap` will run the ad hoc version (tpe).

Adding `_other` will run Floyd-Warshall or Dijkstra (final). 

If `print_ans` is set to true, it will print all the tuples of the answer of the query.

The path used was /home/tcolloca/csv_tables/[test|v1|v2|v3|v4|v5|v6|v7|v8]

### Examples 

```
$> java ar.edu.itba.App /home/tcolloca/csv_tables/v4 final_2_a_other  
```

Runs the Floyd-Warshall algorithm for query 2.a with v4 data without printing tuples.

```
$> java ar.edu.itba.App /home/tcolloca/csv_tables/v6 final_2_d Ana\ Perez 4 true
```
Runs the ad-hoc algorithm for query 2.d with v6 data using Ana Perez as source user and threshold = 4 printing tuples.







