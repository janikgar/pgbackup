FROM minio/mc:latest as source
FROM postgres:16.4-bookworm

COPY --from=source /usr/bin/mc /usr/bin/mc

ADD --chmod=0755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
