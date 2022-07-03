<<<<<<< HEAD
#!/usr/bin/env sh

cd /tmp

PG_HOST=${PG_HOST:-postgres.home.lan}
=======
#!/usr/bin/env bash

cd /tmp

PG_HOST=${PG_HOST:-postgresql14.postgresql14.svc.cluster.local}
>>>>>>> 6fa876b (initial commit)
PG_USER=${PG_USER:-postgres}
PG_PASSWORD=${PG_PASSWORD:-postgres}
PG_PORT=${PG_PORT:-5432}

echo "${PG_HOST}:${PG_PORT}:*:${PG_USER}:${PG_PASSWORD}" > ~/.pgpass
<<<<<<< HEAD
chmod 0600 ~/.pgpass

DATETIME=$(date -Iminutes)

pg_dumpall -f "backup-${DATETIME}.sql" -h ${PG_HOST} -U ${PG_USER}
gzip backup-${DATETIME}.sql

mc cp backup-${DATETIME}.sql.gz syno/postgres-backups
=======

pg_dumpall -f "backup-$(date -Iminutes).sql"
>>>>>>> 6fa876b (initial commit)
