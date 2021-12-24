ARG DEBIAN_VERSION=buster-slim
FROM debian:${DEBIAN_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl  \
    procps \
    openssl  \
    vim \
    gnupg2  \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 kubedrop
