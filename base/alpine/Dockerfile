ARG ALPINE_VERSION=3.13
FROM alpine:${ALPINE_VERSION}

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache \
    tzdata  \
    bash \
    ca-certificates && \
    update-ca-certificates

RUN adduser -s -S -D kubedrop
