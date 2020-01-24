#!/bin/bash

# Write a loop that will produce 1000 random numbers and print them to screen
# Next write out the numbers to a file called rand1.txt
# Write out two more files called rand2.txt and rand3.txt
# Each with 1000 random numbers

for i in `seq 1 1000`
do
   echo $RANDOM 
done > rand1.txt

for j in `seq 1 1000`
do
   echo $RANDOM 
done > rand2.txt

for k in `seq 1 1000`
do
   echo $RANDOM 
done > rand3.txt

# Sort the random numbers in each file in numerical order
# Write out the new values into files called sorted1.txt, sorted2.txt and sorted3.txt
sort -g rand1.txt > sorted1.txt
sort -g rand2.txt > sorted2.txt
sort -g rand3.txt > sorted3.txt

# Combine all three files sorted1.txt sorted2.txt and sorted3.txt into a single file called alldata.dat
paste sorted1.txt sorted2.txt sorted3.txt > alldata.dat





