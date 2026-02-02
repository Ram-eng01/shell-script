#!/bin/bash

if [ $# -gt 0 ];
then
    aws ec2 describe-vpcs --region $@ | jq ".Vpcs[].VpcId"
else
    echo "You have given $# parameters to this script, Please provide parameter at least 1 eg; us-east-1"
fi
echo $#