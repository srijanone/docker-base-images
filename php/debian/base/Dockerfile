ARG BASE_VERSION=10
FROM srijanlabs/debian:${BASE_VERSION}
ARG PHP_VERSION=7.2

ENV NEW_RELIC_ENABLED=false
# ENV NEW_RELIC_APP_NAME=My Application
# ENV NEW_RELIC_LICENSE_KEY=xxxxxxxxxxxxxxxxx

ENV PHP_MEMORY_LIMIT=128M

ENV SYSLOG_SYMLINK=/mnt/syslog/log

ENV PATH "$PATH:/app/bin"

RUN mkdir /app && \
    chown -R continua:continua /app

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates=20190110 \
    lsb-release=10.2019051400 \
    apt-transport-https=1.8.2.1 \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add - \
    && curl -fsSL https://download.newrelic.com/548C16BF.gpg | apt-key add - \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && echo "deb http://apt.newrelic.com/debian/ newrelic non-free" | tee /etc/apt/sources.list.d/newrelic.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-apcu \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-ftp \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-posix \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-sockets \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlreader \
    php${PHP_VERSION}-xmlwriter \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-mysqlnd \
    php${PHP_VERSION}-dev \
    default-mysql-client-core=1.0.5 \
    newrelic-php5 \
    && rm -rf /var/lib/apt/lists/*
