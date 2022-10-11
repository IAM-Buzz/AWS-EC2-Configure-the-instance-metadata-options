#!/bin/bash
INSTANCEID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo
echo "${INSTANCEID}"
echo
printf "Enabling IMDSv2"
echo
aws ec2 modify-instance-metadata-options --instance-id "$INSTANCEID" --http-tokens required --http-endpoint enabled --region us-west-1
echo
