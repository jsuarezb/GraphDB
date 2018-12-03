for version in {4..6}
do
  for query in a b c ;
  do
    echo "java ar.edu.itba.App /home/tcolloca/csv_tables/v$version final_2_${query}_other false"
    java ar.edu.itba.App /home/tcolloca/csv_tables/v$version final_2_${query}_other false
  done
done

for version in {4..6} 
do
  for query in a b c ; 
  do
    echo "java ar.edu.itba.App /home/tcolloca/csv_tables/v$version final_2_$query false"
    java ar.edu.itba.App /home/tcolloca/csv_tables/v$version final_2_$query false
  done
done
