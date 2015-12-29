#!/bin/bash
set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "/app/config/kibana.yml"
sed -i "s;^default_app_id:.*;default_app_id: dashboard/default-Dashboard;" "/app/config/kibana.yml"
exec /app/bin/kibana
