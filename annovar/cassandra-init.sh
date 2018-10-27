#!/usr/bin/env bash
until cqlsh -f /ha_bioinformatica.cql; do
  echo "cqlsh: Cassandra is unavailable to initialize - will retry later"
  sleep 2
done &

exec /docker-entrypoint.sh "$@"