#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 5 ]
then
    echo "Given mumber $NUMBER is greater than 5"
else
    echo "Given number $NUMBER is ess than 5"
fi

# -gt, -lt, -eq, -ge, -le
