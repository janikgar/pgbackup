FROM postgres:16.4-bookworm as source

FROM minio/mc:latest

COPY --from=source /usr/bin/pg_dumpall /usr/bin/pg_dumpall

ADD --chmod=0755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
