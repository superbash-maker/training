#!/bin/bash

# Write me three different files with numbers
# Call if file1, file2 and file3
# Numbers from 0 1000 in steps of 20 should go in file1
# Numbers from 1000 2000 in steps of 20 should go in file2
# Numbers from 2000 3000 in steps of 20 should go in file3
# Give me the sum of file1, file2 and file3 and print to screen
# And give me total sum
# OUTPUT SHOULD LOOK LIKE
# SUM OF FILE1 = ....
# SUM OF FILE2 = ....
# SUM OF FILE3 = ....
# TOTAL SUM = ....
# PUT ALL THE DATA INTO ONE FILE CALLED ALL WITH THREE COLUMNS

for i in `seq 0 20 1000`
do
  echo $i
done > file1

for i in `seq 1000 20 2000`
do
  echo $i
done > file2

for i in `seq 2000 20 3000`
do
  echo $i
done > file3

f1=`awk '{sum+=$1} END {print sum}' file1`
f2=`awk '{sum+=$1} END {print sum}' file2`
f3=`awk '{sum+=$1} END {print sum}' file3`
tot=`awk '{sum+=$1} END {print sum}' file1 file2 file3`

echo "SUM OF FILE1 = " $f1
echo "SUM OF FILE2 = " $f2
echo "SUM OF FILE3 = " $f3
echo "TOTAL SUM = " $tot

paste file1 file2 file3 > all
