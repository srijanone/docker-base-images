FROM debian:buster-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    procps \
    openssl \
    vim \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 continua
