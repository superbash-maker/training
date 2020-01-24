#!/bin/bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"

# We are going to write out first script
echo "Good morning"
# Ask user to enter name
echo "Please enter your name"
# Read in input and store in a variable called name
read name
# Print out the name to the screen
clear
mydate=`date +%d\ %B\ %Y`
echo -e "Hello " $COL_RED $name $COL_RESET "today is " $mydate
