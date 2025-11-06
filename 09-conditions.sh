#!/bin/bash


#-gt -- greater than
#-lt -- less than
#-eq -- equal 
#-ne -- not equal

NUMBER=$1

if [ $NUMBER -lt 10 ]
then
echo "Given Number $NUMBER is less than 10"
else 
echo "Given Number $NUMBER is greater than 10"
fi


