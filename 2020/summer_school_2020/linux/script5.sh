#!/bin/bash
# Generate numbers from 1 to 100 and write to a file called set1.txt
# Generate numbers that are squares of 1 to 100 and write to a file called set2.txt
# Generate numbers that are cubes of 1 to 100 and write to a file called set3.txt
# Combine all the files in three columns and write to a file called all.txt
for i in {1..100}
do
 echo $i
done > set1.txt

for j in {1..100}
do
 echo $j^2 | bc -l 
done > set2.txt

for k in {1..100}
do
  echo $k^3 | bc -l
done > set3.txt 

paste set1.txt set2.txt set3.txt > all.txt 
