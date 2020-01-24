#!/bin/bash

# Lets do some simple math
# Ask the user to enter a number (num1)
echo "Please enter first number"
read num1
# Ask the user to enter a second number (num2)
echo "Please enter second number"
read num2
# Check that the values entered are numbers and not letters
# You need to use a conditional statement to perform this check
# If not a number then print out an appropriate message
re='^[0-9]+$'
if ! [[ $num1 =~ $re ]]
then
  echo "ERROR: " $num1 "is NOT a number"
  exit 1
elif ! [[ $num2 =~ $re ]]
then
  echo "ERROR: " $num2 "is NOT a number"
  exit 1
fi

add=`echo "$num1+$num2" | bc`
sub=`echo "$num1-$num2" | bc`
mul=`echo "$num1*$num2" | bc`
div=`echo "scale=2; $num1/$num2" | bc -l`

echo $num1"+"$num2" = " $add
echo $num1"-"$num2" = " $sub
echo $num1"*"$num2" = " $mul
echo $num1"/"$num2" = " $div
