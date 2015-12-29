FROM alpine:3.1

ENV KIBANA_VERSION 4.1.0-linux-x64

RUN apk add --update nodejs curl && \
    curl -LO https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    tar xzf /kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C / && \
    mv /kibana-${KIBANA_VERSION}/* /app
    rm -rf /var/cache/apk/* /kibana-${KIBANA_VERSION}-linux-x64.tar.gz

ADD run.sh /
RUN chmod ugo+rx /run.sh

EXPOSE 80

CMD ["/run.sh"]
