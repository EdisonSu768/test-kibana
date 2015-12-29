FROM alpine:3.1

ENV KIBANA_VERSION 4.1.0

RUN apk add --update nodejs curl && \
    curl -LO https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    tar xzf /kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C / && \
    rm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/node && \
    rm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/npm && \
    ln -s /usr/bin/node /kibana-${KIBANA_VERSION}-linux-x64/node/bin/node && \
    ln -s /usr/bin/npm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/npm && \
    rm -rf /var/cache/apk/* /kibana-${KIBANA_VERSION}-linux-x64.tar.gz

RUN mkdir -p app && \  
    cp -r /kibana-${KIBANA_VERSION}-linux-x64/* /app && \
    cd / && rm -rf /kibana-${KIBANA_VERSION}-linux-x64

RUN sed -i "s;^elasticsearch_url:.*;elasticsearch_url:http://localhost:9200;" "/app/config/kibana.yml" && \
    sed -i "s;^default_app_id:.*;default_app_id: dashboard/default-Dashboard;" "/app/config/kibana.yml"

EXPOSE 5601

CMD ["/app/kibana-4.1.0-linux-x64/bin/kibana"]
