#!/bin/bash

# Lets get some random numbers
# Make a file called randnum.dat with 10000 random numbers
# cat the file randnum.dat and count the number of lines
# sort the numbers in numerical order and write to a file called sortednum.dat
# print out the top 5 and bottom 5 numbers to make sure they are sorted
# Calculate the sum of all the numbers and print 


for i in `seq 1 10000`
do
  echo $RANDOM
done > randnum.dat

#cat randnum.dat | wc -l
sort -n randnum.dat > sortednum.dat
#head -5 sortednum.dat
#tail -5 sortednum.dat
# THE SUM OF THE NUMBERS IS: .....
add=`awk '{sum += $1} END {print sum}' sortednum.dat`
echo "THE SUM OF THE NUMBERS IS: "$add
