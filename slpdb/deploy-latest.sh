#!/bin/bash

version=$(openssl rand -hex 12)

echo "Deploying latest to slpdb and slpdb-testnet"

docker build --no-cache -t spendbch/slpdb:latest .

docker push spendbch/slpdb:latest

docker tag spendbch/slpdb:latest spendbch/slpdb:$version
docker push spendbch/slpdb:$version

kubectl set image statefulset/slpdb-deploy slpdb=spendbch/slpdb:$version
kubectl set image statefulset/slpdb-testnet-deploy slpdb=spendbch/slpdb:$version
