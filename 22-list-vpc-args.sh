#!/bin/bash
#REGION=$1
#aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"




REGIONS="$@"
for REGION in $REGIONS;
do
aws ec2 describe-vpcs --region $REGIONS | jq ".Vpcs[].VpcId"
done