FROM butler_base
MAINTAINER Qiming

ENV KIBANA_VERSION 4.1.0-linux-x64

RUN export DEBIAN_FRONTEND=noninteractive && \
    sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget ca-certificates

RUN wget https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz -O /tmp/kibana.tar.gz && \
    mkdir -p /app && \
    tar zxf /tmp/kibana.tar.gz && mv kibana-${KIBANA_VERSION}/* /app

