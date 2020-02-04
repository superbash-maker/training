#!/bin/bash
# Write a script that will take in the number of rows from the user
# Based on the number you should draw a pyramid of O's with XX rows
echo "How many rows would you like your pyramid to have"
read rows
for((i=1;i<=rows;i++))
do
        # This will print the spaces 
	for ((j=i;j<=rows;j++))
	do
		echo -n " "
	done
	# This will print the characters
	for ((k=1;k<2*i;k++))
	do
		echo -n "O"
	done
	# This will print a new line
	echo
done
