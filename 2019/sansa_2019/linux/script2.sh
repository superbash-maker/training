#!/bin/bash

# Lets get some random numbers
# Make a file called randnum.dat with 10000 random numbers
for i in `seq 1 10000`
do
  echo $RANDOM
done > randnum.dat
# Count the number of lines in randnum.dat
lines=`cat randnum.dat | wc -l`
echo "The number of lines in randnum is: "$lines
# Sort the numbers in numerical order and write to a file called
# sortednum.dat
sort -n randnum.dat > sortednum.dat
# print out the top 5 and bottom 5 numbers to make sure they are sorted
top=`head -5 sortednum.dat`
bot=`tail -5 sortednum.dat`
echo "TOP 5 LINES: "
echo $top
echo "BOTTOM 5 LINES: "
echo $bot
# Calculate the sum of all the numbers and print the result to screen
add=`awk '{sum+=$1} END {print sum}' sortednum.dat`
echo "The sum of the numbers is: "$add
