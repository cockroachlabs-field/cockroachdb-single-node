#!/bin/sh

echo "******************************* starting single cockroach node..."

if [[ -n "$MEMORY_SIZE" ]];
then
  ./cockroach start-single-node --insecure --log-config-file=logs.yaml --cache=.25 --background --store=type=mem,size=${MEMORY_SIZE}
else
  ./cockroach start-single-node --insecure --log-config-file=logs.yaml --cache=.25 --background
fi

echo "******************************* setting optimizations"

./cockroach sql --insecure --file optimizations.sql

echo "******************************* checking DATABASE_NAME"

if [[ -n "$DATABASE_NAME" ]]; then
  echo "******************************* found DATABASE_NAME [${DATABASE_NAME}], creating..."
  ./cockroach sql --insecure --execute="CREATE DATABASE ${DATABASE_NAME};"
fi

cd /cockroach/cockroach-data/logs
tail -f cockroach.log