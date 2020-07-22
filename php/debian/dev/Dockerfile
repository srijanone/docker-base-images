ARG PHP_VERSION=7.2
ARG BASE_VERSION=10
FROM srijanlabs/php-fpm:${PHP_VERSION}-${BASE_VERSION}

ARG PHP_VERSION=7.2

ENV PHP_MEMORY_LIMIT=512M \
    PHP_UPLOAD_MAX_FILESIZE=20M \
    PHP_MAX_EXECUTION_TIME=512

USER root

# commands are sfe from word splitting and expecting latest version
# hadolint ignore=SC2046,DL3008
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php${PHP_VERSION}-xdebug \
    && PHP_VERISON=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") \
    && curl -sSL -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s "https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$PHP_VERISON" \
    && mkdir -p /tmp/blackfire \
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp/blackfire \
    && mv /tmp/blackfire/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
    && rm -rf /tmp/blackfire /tmp/blackfire-probe.tar.gz \
    && curl -sSL -o mhsendmail -D - -L -s 'https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64' \
    && chmod +x mhsendmail \
    && mv mhsendmail /usr/bin/

# @TODO: Fix the concept of PHP_INI_SCAN_DIR.
COPY conf.d/01_blackfire.ini ${PHP_INI_DIR}/01_blackfire.ini
COPY conf.d/50_dev.ini ${PHP_INI_DIR}/50_dev.ini
COPY conf.d/01_xdebug.ini ${PHP_INI_DIR}/01_xdebug.ini

USER continua
