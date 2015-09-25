#!/bin/bash

set -e

ZK_HOST=${KAFKA_PORT_2181_TCP_ADDR:-${ZK_HOST}}
ZK_PORT=${KAFKA_PORT_2181_TCP_PORT:-${ZK_PORT}}
if [ -z "${ZK_HOST}" ]; then
    echo "Set ZK_HOST via env var or link to kafka container"
    exit 1
fi
export ZK_HOSTS=${ZK_HOST}:${ZK_PORT}

bin/kafka-manager
