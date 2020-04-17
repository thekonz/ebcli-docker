FROM python:3.7.7-alpine3.11

RUN apk add --no-cache git && \
    apk add --no-cache --virtual build-deps \
        build-base \
        gcc \
        wget \
        libffi-dev \
        openssl-dev && \
    pip install --no-cache-dir awsebcli && \
    apk del build-deps

COPY ./entrypoint.sh /

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
