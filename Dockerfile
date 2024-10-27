FROM postgres:16.4-bookworm as source
FROM minio/mc:latest

COPY --from=source /usr/bin/mc /usr/bin/mc
COPY entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
