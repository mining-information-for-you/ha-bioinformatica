#!/usr/bin/env bash
until cqlsh -f /ha_bioinformatica.cql; do
  sleep 2
done &

exec /docker-entrypoint.sh "$@"