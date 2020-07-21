ARG ALPINE_VERSION=3.9
FROM alpine:${ALPINE_VERSION}

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache tzdata bash ca-certificates && \
    update-ca-certificates

RUN adduser -S -D continua
