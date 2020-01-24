#!/bin/bash

# Generate 3 files
# file1.txt with numbers 1 1000
# file2.txt with numbers from file1 squared
# file3.txt with numbers from file1 to the power 3
# combine all three files into allfiles.txt column wise
rm file1.txt file2.txt file3.txt

for i in `seq 1 1000`
do
 echo $i >> file1.txt
 echo $i^2 | bc -l >> file2.txt
 echo $i^3 | bc -l >> file3.txt
done

paste file1.txt file2.txt file3.txt > allfiles.txt

