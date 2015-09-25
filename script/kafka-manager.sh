#!/bin/bash
set -e

# Change directory to read .envrc
DIR=$(cd $(dirname ${0})/.. && pwd)
cd $DIR

echo "====> Build docker image for kafka-manager"
docker build -t tcnksm/kafka-manager .

echo "====> Run kafka-manager on 192.168.59.103:9000"
echo "      Register single node kafka cluster by 192.168.59.103:2181"
docker run --rm -it \
       --link kafka:kafka \
       --publish 9000:9000 \
       tcnksm/kafka-manager

