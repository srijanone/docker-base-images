ARG ALPINE_VERSION=3.13
FROM alpine:${ALPINE_VERSION}

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache \
    tzdata=2020a-r0 \
    bash=4.4.19-r1 \
    ca-certificates=20191127-r2 && \
    update-ca-certificates

RUN adduser -s -S -D continua
