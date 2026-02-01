#!/bin/bash

TOTAL_MEM=$(free -m | grep -i "mem" | awk -F " " '{print $2}')
TOTAL_AVAIL=$(free -m | grep -i "mem" | awk -F " " '{print $7}')

USED_MEMORY=$(expr $TOTAL_MEM - $TOTAL_AVAIL)
echo "The total memory In the machine is ${TOTAL_MEM}MB and current Utilization is ${USED_MEMORY}MB"