#!/bin/bash

DOCKERHUB_LOGIN=`aws ssm get-parameters --names docker_hub_username --query "Parameters[*].Value" --output text`
DOCKERHUB_PASSWORD=`aws ssm get-parameters --with-decrypt --names docker_hub_password --query "Parameters[*].Value" --output text`

docker login -u $DOCKERHUB_LOGIN -p $DOCKERHUB_PASSWORD

docker pull $DOCKERHUB_LOGIN/portfolio-app:Latest

docker logout