#!/bin/bash
echo "How many iterations do you want:"
read iter
for i in `seq 1 $iter`
do
  ./script2.sh
done | grep 'The sum' | awk '{ sum += $7 } END { if (NR > 0) print "The average is: " sum / NR }'
