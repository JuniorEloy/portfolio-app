#!/usr/bin/env bash

set -e

DOCKERHUB_VERSION=`aws ssm get-parameters --names docker_hub_version --query "Parameters[*].Value" --output text` 

docker run -d -p 80:5003 --name="portfolio-app" junioreloy/portfolio-app:$DOCKERHUB_VERSION 