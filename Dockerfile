FROM ubuntu:trusty

MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

RUN apt-get update; apt-get install -y unzip  openjdk-6-jdk wget git

ENV SCALA_VERSION 2.10
ENV KAFKA_VERSION 0.8.2.0
ENV KAFKA_PRE kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ENV KAFKA_ARCHIVE ${KAFKA_PRE}.tgz
RUN wget -q http://apache.mirrors.lucidnetworks.net/kafka/${KAFKA_VERSION}/${KAFKA_ARCHIVE} -O /tmp/${KAFKA_ARCHIVE} \
 && tar xfz /tmp/${KAFKA_ARCHIVE} -C /opt \
 && rm -f /tmp/${KAFKA_ARCHIVE}

VOLUME ["/data/kafka/logs"]

ENV KAFKA_HOME /opt/${KAFKA_PRE}
RUN ln -s /opt/${KAFKA_PRE} /opt/kafka
ADD config/server.properties /opt/kafka/config/server.properties
ADD start-kafka.sh /usr/bin/start-kafka.sh
CMD start-kafka.sh 
