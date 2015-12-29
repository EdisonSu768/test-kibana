FROM alpine:3.2
MAINTAINER Ellison Lou

ENV KIBANA_VERSION 4.1.0-linux-x64

RUN apk add --update nodejs curl && \
    ln -sf /kibana-${KIBANA_VERSION} /kibana && \
    curl -sL https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar xz -C / && \
    rm -rf /kibana/node && \
    mkdir -p /kibana/node/bin && \
    ln -sf /usr/bin/node /kibana/node/bin/node && \
    apk del curl && \
    rm -rf /var/cache/apk/*
