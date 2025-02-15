#!bin/bash

####################################
# Author: Rammohan

# Script to automate the process of listing all the resources in an aws account

# Below are the some of the services are supported by this script

# 1. Ec2
# 2. S3
# 3. VPC
# 4. IAM
# 5. Route53
# 6. Cloud Watch
# 7. Lambda
# 8. RDS
# 9. EBS
# 10. ELB

# Usage: sh 20-aws-resource-list.sh <region> <service_name>

# Example: sh 20-aws-resource-list.sh us-apsouth-1 s3
########################################################

# check if the required num of arguments are passed

if [ $# -ne 2 ]
then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# check if the aws cli is installed

if ! command aws --version &> /dev/null
then
    echo "AWS CLI is not installed, Please instal it and try again."
    exit 1
fi

# check if the AWS CLI is configured

if [ ! -d ~/.aws  ]
then  
    echo "aws is not configured, Please configure"
    exit 1
fi
# List of resources based on the service

case $2 in 
    EC2)
        aws ec2 describe-instances --region $1
        ;;
    S3)
        aws s3api list-buckets --region $1
        ;;
    RDS)
        aws rds describe-db-instances --region $1
        ;;
    Lambda)
        aws lambda list-functions --region $1
        ;;
    EBS)
        aws ec2 describe-volumes --region $1
        ;;
    ELB)
        aws elb describe-load-balancers --region $1
        ;;
    Route53)
        aws route53 list-hosted-zones --region $1
        ;;
    VPC)
        aws ec2 describe-vpcs --region $1
        ;;
    IAM)
        aws iam list-users --region $1
        ;;
    *)
        echo " Invalid service name. Please enter valid service name."
        exit 1
        ;;
    esac




