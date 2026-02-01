#!/bin/bash
# REGION=$1
# aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"



REGIONS=$@
for REGION in $REGIONS; do
    cowsay "-----------${REGION}---------------"
    aws ec2 describe-vpcs --region "$REGION" | jq -r '.Vpcs[].VpcId'
done
