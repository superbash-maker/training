#!/bin/bash

mkdir -p numbers
cd numbers
rm *.txt
for i in `seq 1 100`
do
  touch $RANDOM.txt
done
for i in `ls *.txt`
do
  basename $i .txt 
done > unsorted
sort -n unsorted > ../random.txt
rm *txt unsorted
mv ../random.txt .
