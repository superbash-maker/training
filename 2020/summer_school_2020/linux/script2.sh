#!/bin/bash

# Write a script that will request for a person to enter their name
# Print a greeting to the person followed by todays date
# In the following format:
# Hello Krishna today is the 03rd February 2020
# Print only the above statement on the screen and clear everything else
echo "Please enter your name"
read name
echo "Hello "$name
day=`date +%d`
month=`date +%B`
year=`date +%Y`
clear
echo "Hello" $name "today is the" $day"rd" $month $year
