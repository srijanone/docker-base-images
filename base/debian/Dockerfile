ARG DEBIAN_VERSION=buster-slim
FROM debian:${DEBIAN_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl=7.64.0-4+deb10u1 \
    procps=2:3.3.15-2 \
    openssl=1.1.1d-0+deb10u4 \
    vim=2:8.1.0875-5 \
    gnupg2=2.2.12-1+deb10u1 \
    ca-certificates=20200601~deb10u2 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 continua
