FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    curl \
    procps \
    openssl \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 continua
