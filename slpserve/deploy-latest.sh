#!/bin/bash

version=$1

docker build -t spendbch/slpserve:latest .

docker push spendbch/slpserve:latest

docker tag spendbch/slpserve:latest spendbch/slpserve:$version
docker push spendbch/slpserve:$version

kubectl set image statefulset/slpserve-deploy slpserve=spendbch/slpserve:$version
