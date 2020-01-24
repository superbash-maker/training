#!/bin/bash

# Write me two files that contain data points
# Call the first file data1.txt and the second file data2.txt
# data1.txt must contain values from 0 10000 in step sizes of 10
# data2.txt must contain values from 20000 30000 in step sizes of 100
# Count the number of lines in data1.txt and data2.txt
# Print the following to screen
# THE NUMBER OF LINES IN data1.txt = NUM1
# THE NUMBER OF LINES IN data2.txt = NUM2

seq 0 10 10000 > data1.txt
seq 20000 100 30000 > data2.txt
num1=`cat data1.txt | wc -l`
num2=`cat data2.txt | wc -l`

echo "THE NUMBER OF LINES IN data1.txt = "$num1
echo "THE NUMBER OF LINES IN data2.txt = "$num2

