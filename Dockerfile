FROM alpine:3.1

ENV KIBANA_VERSION 4.1.0

RUN apk add --update nodejs curl && \
    curl -LO https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    tar xzf /kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C / && \
    mkdir -p /app && \
    mv /kibana-${KIBANA_VERSION}-linux-x64/* /app && \
    rm -rf /var/cache/apk/* /kibana-${KIBANA_VERSION}-linux-x64.tar.gz


