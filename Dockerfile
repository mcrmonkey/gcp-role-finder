FROM alpine:latest

ENV ROLES_DB "/data/roles.db"

RUN apk add python3 py3-pip py3-google-api-python-client

add gcp-role-find /

ENTRYPOINT ["/gcp-role-find"]