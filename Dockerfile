FROM minio/mc:latest AS minio

FROM alpine:3.17

COPY --from=minio /usr/bin/mc /usr/bin/

ADD --chmod=0755 entrypoint.sh /
RUN apk update && apk add postgresql15-client

ENTRYPOINT ["/entrypoint.sh"]
