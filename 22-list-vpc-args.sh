#!/bin/bash
# REGION=$1
# aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"




for REGION in "$@"; do
    aws ec2 describe-vpcs --region "$REGION" \
        | jq -r '.Vpcs[].VpcId'
done
