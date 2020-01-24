#!/bin/bash

# Lets do some math
# Ask the user for two of numbers e.g. 
# Please enter number 1
# Please enter number 2
# Print the following:
# The addition of number1 and number2 is:
# The difference of number1 and number2 is:
# The multiplication of number1 and number2 is:
# The division of number1 and number2 is: 

echo "Please enter number 1"
read num1
echo "Please enter number 2"
read num2

re='^[0-9]+$'
if ! [[ $num1 =~ $re && $num2 =~ $re ]]
 then
   echo "error: Not a number" 
else
   add=`echo $num1+$num2 | bc`
   sub=`echo $num1-$num2 | bc`
   mul=`echo $num1*$num2 | bc`
   div=`echo $num1/$num2 | bc -l`

   echo "The addition of number1 + number2 is: "$add
   echo "The difference of number1 and number2 is: "$sub
   echo "The multiplication of number1 and number2 is: "$mul
   echo "The division of number1 and number2 is: "$div
fi
