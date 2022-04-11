#!/bin/sh

set -e

if [ -z "${GCS_BUCKET}" ]; then
  echo >&2 "GCS_BUCKET must be set"
  exit 1
fi

# if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
#   echo >&2 "AWS_ACCESS_KEY_ID must be set"
#   exit 1
# fi

# if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
#   echo >&2 "AWS_SECRET_ACCESS_KEY must be set"
#   exit 1
# fi

mkdir -p "${FILE_DIR}"

mlflow server \
    --backend-store-uri "file://$FILE_DIR" \
    --default-artifact-root "gs://$GCS_BUCKET/mlflow/artifacts" \
    --host 0.0.0.0 \
    --port "$PORT"
