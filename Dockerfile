FROM arm32v6/golang:1.13-alpine3.11
LABEL maintainer="yago.riveiro@gmail.com"

ARG VERSION=1.12
ARG URL="https://github.com/tianon/gosu/releases/download/${VERSION}/gosu-armhf"
ARG SHA256="8768127e22410b74edf6bab39e732ff41f260d69b2e30891ade3634e9aa11b81"

RUN apk add --no-cache --virtual build-dependencies \
    curl==7.67.0-r0 && \
    curl -L --fail --silent --show-error ${URL} > /usr/local/bin/gosu && \
    echo "${SHA256}  /usr/local/bin/gosu" | sha256sum -c -s && \
    chmod +x /usr/local/bin/gosu && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*
