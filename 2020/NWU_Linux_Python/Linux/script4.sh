#!/bin/bash

# This is going to be a little more challenging
# Write a for loop which will generate 100 random numbers
for i in `seq 1 100`
do
  echo $RANDOM
done | sort -n > numbers.txt

# Sort the numbers in numerical order
# Write out the sorted numbers to a file called numbers.txt
# Count the number of lines in the file numbers.txt 
lines=`cat numbers.txt | wc -l`
# Then print "numbers.txt contains XX lines"
echo "numbers.txt contains "$lines" lines"

# Loop through the numbers in numbers.txt 
# Determine how many are even and how many are odd
even=0
odd=0
for j in `cat numbers.txt`
do
  if [ $((j%2)) -eq 0 ]
   then
      let even=even+1
   else
      let odd=odd+1
  fi
done

# Print out "There are XX even and YY odd numbers"
echo "There are "$even" even numbers and "$odd" odd numbers"

# Sum up the numbers in numbers.txt
add=`awk '{sum+=$1} END {print sum}' numbers.txt`
echo "The sum of the numbers is "$add
