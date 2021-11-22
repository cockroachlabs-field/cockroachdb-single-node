#!/bin/sh

echo "starting single cockroach node..."

if [[ -n "$MEMORY_SIZE" ]]
then
  ./cockroach start-single-node --insecure --store=type=mem,size=${MEMORY_SIZE}
else
  ./cockroach start-single-node --insecure
fi


if [[ -n "$DATABASE_NAME" ]]; then
  echo "found DATABASE_NAME [${DATABASE_NAME}], creating..."
  ./cockroach sql --insecure --execute="CREATE DATABASE ${DATABASE_NAME};"
fi

tail -f cockroach-data/logs/cockroach.log