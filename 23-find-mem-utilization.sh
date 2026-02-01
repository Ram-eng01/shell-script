#!/bin/bash

TOTAL_MEM=$(free -m | grep -i "mem" | awk -F " " '{print $2}')
TOTAL_AVAIL=$(free -m | grep -i "mem" | awk -F " " '{print $7}')

USED_MEMORY=$(expr $TOTAL_MEM - $TOTAL_AVAIL)
echo "The total memory In the machine is ${TOTAL_MEM}MB and current Utilization is ${USED_MEMORY}MB"

X=$(echo "scale=2; $TOTAL_AVAIL / $TOTAL_MEM "| bc | tr -d ".")


echo "The free memory percentage is ${X}%"
CURRENT_UTL_PER=$(expr 100 - $X)

if [ $X -le 10 ];
then  
   echo "Mmeory is utilizec more than 90%"
else
   echo "Current memory utilization is ${CURRENT_UTL_PER}% and within the limits."
fi
