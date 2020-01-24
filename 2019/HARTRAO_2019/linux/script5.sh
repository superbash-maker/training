#!/bin/bash

# LETS DO SOME MATH
# ASK THE USER TO ENTER 2 NUMBERS
# STORE THE NUMBERS AS VARIABLES NUM1 AND NUM2
# ADD NUM1 AND NUM2
# SUBTRACT NUM1 FROM NUM2
# MULTIPLY NUM1 AND NUM2
# DIVIDE NUM1 BY NUM2

# AT THE END PRINT OUT 
# NUM1+NUM2=....
# NUM2-NUM1=....
# NUM1*NUM2=....
# NUM1/NUM2=....

echo "Please enter a number"
read num1
echo "Please enter another number"
read num2

re='^[0-9]+$'
if ! [[ $num1 =~ $re ]]
 then
   echo "error: " $num1 " is Not a number" 
   exit 1
fi

if ! [[ $num2 =~ $re ]]
 then
   echo "error: " $num2 " is Not a number" 
   exit 1
fi

add=`echo $num1+$num2 | bc`
sub=`echo $num1-$num2 | bc`
mult=`echo $num1*$num2 | bc`
div=`echo $num1/$num2 | bc -l`

echo $num1" + "$num2" = "$add
echo $num1" - "$num2" = "$sub
echo $num1" * "$num2" = "$mult
echo $num1" / "$num2" = "$div

