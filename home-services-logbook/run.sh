#!/usr/bin/env bash
set -e

OPTIONS_FILE=/data/options.json

# Read addon options written by Home Assistant Supervisor
if [ -f "${OPTIONS_FILE}" ]; then
    TRUST_UPSTREAM_AUTH=$(jq --raw-output '.trust_upstream_auth // false' "${OPTIONS_FILE}")
    ALLOW_ACTOR_OVERRIDE=$(jq --raw-output '.allow_actor_override // true' "${OPTIONS_FILE}")
else
    TRUST_UPSTREAM_AUTH=false
    ALLOW_ACTOR_OVERRIDE=true
fi

export TRUST_UPSTREAM_AUTH
export ALLOW_ACTOR_OVERRIDE

# Persistent data paths mapped to the HA addon /data volume
export APP_DATA_DIR=/data
export APP_UPLOADS_DIR=/data/uploads
export APP_DB_PATH=/data/logbook.db

# When accessed through HA ingress the supervisor injects INGRESS_PATH,
# which tells FastAPI where the app is mounted so links and redirects work.
export APP_ROOT_PATH="${INGRESS_PATH:-}"

mkdir -p /data/uploads

cd /app

exec uvicorn app.main:app --host 0.0.0.0 --port 8000
