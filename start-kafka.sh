#!/bin/bash
echo "booting broker with id ${KAFKA_BROKER_ID}..."
echo "broker.id=${KAFKA_BROKER_ID}" >> /opt/kafka/config/server.properties

echo "putting logs into ${KAFKA_LOG_DIRS}..."
echo "log.dirs=${KAFKA_LOG_DIRS}" >> /opt/kafka/config/server.properties

echo "finding zookeeper at ${KAFKA_ZK}..."
echo "zookeeper.connect=${KAFKA_ZK}" >> /opt/kafka/config/server.properties

/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
