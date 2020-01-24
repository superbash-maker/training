#!/bin/bash
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"

# Lets read in information from a user
#echo "Please enter your name "
#read name
# I would like you to print a greeting to the person, but with a twist
# Print Hello NAME welcome
# Make the NAME in RED
# Only the greeting should be on the screen and nothing else
#clear
#echo -e "Hello "$COL_RED $name $COL_RESET "welcome"
# Ask the person to enter two numbers and store them as num1 and num2
echo "Enter a number"
read num1
echo "Enter a second number"
read num2
# Do the addition, subtraction, multiplication and division of these two numbers
# Check to make sure that num1 and num2 are numbers and if they are not then the program should exit with an appropriate error

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

# Print out the following at the end
# The addition of num1 and num2 = answer
add=`echo $num1"+"$num2 | bc`
echo -e "The addition of "$num1 "and" $num2 "=" $COL_RED $add $COL_RESET
# The subtraction of num1 and num2 = answer
sub=`echo $num1"-"$num2 | bc`
echo -e "The subtraction of "$num1 "and" $num2 "=" $COL_RED $sub $COL_RESET
# The division of num1 by num2 = answer
div=`echo $num1"/"$num2 | bc -l`
echo -e "The division of "$num1 "by" $num2 "=" $COL_RED $div $COL_RESET
# The multiplication of num1 and num2 = answer
# Make each answer RED in color
mul=`echo $num1"*"$num2 | bc`
echo -e "The multiplicaton of "$num1 "and" $num2 "=" $COL_RED $mul $COL_RESET
