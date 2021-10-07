#!/bin/sh

echo "starting single cockroach node..."

./cockroach start-single-node --insecure --background

if [[ -n "$DATABASE_NAME" ]]; then
  echo "found DATABASE_NAME [${DATABASE_NAME}], creating..."
  ./cockroach sql --insecure --execute="CREATE DATABASE ${DATABASE_NAME};"
fi

tail -f cockroach-data/logs/cockroach.log