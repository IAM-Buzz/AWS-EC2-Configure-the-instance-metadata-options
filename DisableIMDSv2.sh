#!/bin/bash
TOKEN=`curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300"`
INSTANCEID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN")
echo
echo $INSTANCEID
echo
printf "Disable IMDSv2 and Enable IMDSv1"
echo
aws ec2 modify-instance-metadata-options --instance-id $INSTANCEID --http-tokens optional --http-endpoint enabled --region us-west-1
echo
