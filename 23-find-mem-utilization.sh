#!/bin/bash

TOTAL_MEM=$(free -m | grep -i "mem" | awk -F " " '{print $2}')
TOTAL_AVAIL=$(free -m | grep -i "mem" | awk -F " " '{print $7}')

USED_MEMORY=$(expr $TOTAL_MEM - $TOTAL_AVAIL)
echo "The total memory In the machine is ${TOTAL_MEM}MB and current Utilization is ${USED_MEMORY}MB"

FREE_PERCENT=$(awk -v avail="$TOTAL_AVAIL" -v total="$TOTAL_MEM" \
    'BEGIN { printf "%.2f", (avail/total)*100 }')

echo "The free memory percentage is ${FREE_PERCENT}%"
CURRENT_UTL_PER=$(expr 100 - $FREE_PERCENT)

if [ $FREE_PERCENT -le 10 ];
then  
   echo "Mmeory is utilizec more than 90%"
else
   echo "Current memory utilization is ${CURRENT_UTL_PER}% and within the limits."
fi
