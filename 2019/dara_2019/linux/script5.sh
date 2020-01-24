#!/bin/bash

# Generate me 3 files 
# file1.txt with numbers 1 1000
# file2.txt with numbers from file1 squared
# file3.txt with numbers from file1 to the power 5
# combine all three files into allfiles.txt column wise
for i in `seq 1 1000`
do
  echo $i
done > file1.txt

for j in `cat file1.txt`
do
  echo $j^2 | bc -l
done > file2.txt

for k in `cat file1.txt`
do
  echo $k^3 | bc -l
done > file3.txt

paste file1.txt file2.txt file3.txt > allfiles.txt
