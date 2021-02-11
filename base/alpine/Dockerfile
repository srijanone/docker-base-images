ARG ALPINE_VERSION=3.13
FROM alpine:${ALPINE_VERSION}

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache \
    tzdata=2021a-r0\
    bash=5.1.0-r0 \
    ca-certificates=20191127-r5 && \
    update-ca-certificates

RUN adduser -s -S -D continua
