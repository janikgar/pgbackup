FROM postgresql:16.4-bookworm as source

FROM minio/mc:latest

COPY --from=source /usr/bin/pg_dumpall /usr/bin/pg_dumpall
COPY entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
