FROM ubuntu:14.04
MAINTAINER Qiming

ENV KIBANA_VERSION 4.1.0-linux-x64


RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y curl supervisor ca-certificates ssh-client &&\
    curl -sL https://deb.nodesource.com/setup_iojs_2.x | bash - &&\
    apt-get install --no-install-recommends -y iojs &&\
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive && \
    sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget ca-certificates
RUN wget https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz -O /tmp/kibana.tar.gz && \
    mkdir -p /app && \
    tar zxf /tmp/kibana.tar.gz && mv kibana-${KIBANA_VERSION}/* /app

ADD run.sh /

RUN chmod ugo+rx /run.sh

EXPOSE 80

CMD ["/run.sh"]
