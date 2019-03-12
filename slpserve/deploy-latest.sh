#!/bin/bash

version=$1

echo "Deploying version $version to slpserve and slpserve-testnet"

docker build -t spendbch/slpserve:latest .

docker push spendbch/slpserve:latest

docker tag spendbch/slpserve:latest spendbch/slpserve:$version
docker push spendbch/slpserve:$version

kubectl set image statefulset/slpserve-deploy slpserve=spendbch/slpserve:$version
kubectl set image statefulset/slpserve-testnet-deploy slpserve=spendbch/slpserve:$version
