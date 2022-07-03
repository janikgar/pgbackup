#!/usr/bin/env sh

cd /tmp

PG_HOST=${PG_HOST:-postgres.home.lan}
PG_USER=${PG_USER:-postgres}
PG_PASSWORD=${PG_PASSWORD:-postgres}
PG_PORT=${PG_PORT:-5432}

echo "${PG_HOST}:${PG_PORT}:*:${PG_USER}:${PG_PASSWORD}" > ~/.pgpass

chmod 0600 ~/.pgpass

DATETIME=$(date -Iminutes)

pg_dumpall -f "backup-${DATETIME}.sql" -h ${PG_HOST} -U ${PG_USER}
gzip backup-${DATETIME}.sql

mc cp backup-${DATETIME}.sql.gz syno/postgres-backups
