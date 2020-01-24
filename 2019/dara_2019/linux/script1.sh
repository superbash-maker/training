#!/bin/bash

# This is our first script
#echo "Please enter your name"
#read name

# Task 
# Print out a greeting to the person
#clear
#echo "Hello " $name " how are you"

# Create a file with 5 names called people.txt
# Loop through each name in the file people.txt and print a 
# Hello .... how are you

for names in 'Krishna' 'Daniel' 'Andrew' 'Kevin' 'Sakile'
do 
  echo $names 
done > people.txt

for i in `cat people.txt`
do
  echo "Hello "$i" how are you"
done
