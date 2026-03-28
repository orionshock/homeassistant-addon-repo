#!/usr/bin/env bash
set -euo pipefail

OPTIONS_FILE=/data/options.json

# Read addon options written by Home Assistant Supervisor
if [ -f "${OPTIONS_FILE}" ]; then
    ALLOW_ACTOR_OVERRIDE=$(jq --raw-output '.allow_session_user_override // false' "${OPTIONS_FILE}")
    APP_DATA_DIR=$(jq --raw-output '.data_dir // "/data"' "${OPTIONS_FILE}")
else
    ALLOW_ACTOR_OVERRIDE=false
    APP_DATA_DIR=/data
fi

export ALLOW_ACTOR_OVERRIDE

# If unset or empty, fall back to /data.
if [ -z "${APP_DATA_DIR}" ]; then
    APP_DATA_DIR=/data
fi

export APP_DATA_DIR
export APP_UPLOADS_DIR="${APP_DATA_DIR}/uploads"
export APP_DB_PATH="${APP_DATA_DIR}/logbook.db"

export USE_UPSTREAM_AUTH=true
export UPSTREAM_ACTOR_HEADER=X-Remote-User

export USE_UPSTREAM_ROOT_PATH=true
export UPSTREAM_ROOT_PATH_HEADER=X-Ingress-Path

mkdir -p "${APP_UPLOADS_DIR}"

cd /app

exec uvicorn app.main:app \
    --host 0.0.0.0 \
    --port 8000 \
    --proxy-headers \
    --forwarded-allow-ips="*"
