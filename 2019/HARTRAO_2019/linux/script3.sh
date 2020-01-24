#!/bin/bash

# Write a script that asks a user for the first number
# Then asks the user for a second number
# Call the variables num1 and num2
# Then print out:
# The sum of num1+num2 = 
# The difference of num1-num2 =
# The multiplication of num1*num2 = 
# The division of num1/num2 = 

echo "Enter first number"
read num1
echo "Enter second number"
read num2
add=`echo $num1"+"$num2 | bc`
sub=`echo $num1"-"$num2 | bc`
mul=`echo $num1"*"$num2 | bc`
div=`echo $num1"/"$num2 | bc -l`

echo "The sum of "$num1"+"$num2 "=" $add 
echo "The difference of "$num1"-"$num2 "=" $sub
echo "The multiplication of "$num1"*"$num2 "=" $mul 
echo "The division of "$num1"/"$num2 "=" $div 
