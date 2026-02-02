#!/bin/bash


aws ec2 describe-vpcs --region $@ | jq ".Vpcs[].VpcId"

echo $#