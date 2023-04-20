#!/bin/bash

#This script will report AWS resource usages
##########
#Auther: Subhasish Mishra
#Version: v1
##########

set -x

#List AWS EC2 Instances
echo "List of EC2 instances" > Resources.txt
echo "#####################" >> Resources.txt
aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId" >> Resources.txt

#AWS S3
echo "List of S3 buckets" >> Resources.txt
echo "#####################" >> Resources.txt
aws s3 ls >> Resources.txt

#AWS Lambda
echo "List of Lambda functions" >> Resources.txt
echo "#####################" >> Resources.txt
aws lambda list-functions | jq ".Functions[].FunctionName" >> Resources.txt

#AWS IAM Users
echo "List of IAM Users" >> Resources.txt
echo "#####################" >> Resources.txt
aws iam list-users | jq ".Users[].UserName" >> Resources.txt
