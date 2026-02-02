#!/bin/bash

if [ $# -gt 0 ];
then
    for REGION in $*;do
        echo "[#-------${REGION}-------#]"
        aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"
    done
else
    echo "You have given $# parameters to this script, Please provide parameter at least 1 eg; us-east-1"
fi

echo You have gave three paremeters $#