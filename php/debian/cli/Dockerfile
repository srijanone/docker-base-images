ARG PHP_VERSION=7.2
ARG BAE_VERSION=10
FROM srijanlabs/php:${PHP_VERSION}-${BAE_VERSION}

ARG PHP_VERSION=7.2

ENV PHP_MEMORY_LIMIT=256M

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    git=1:2.20.1-2+deb10u3 \
    patch=2.7.6-3+deb10u1 \
    unzip=6.0-23+deb10u1 \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && rm -rf /var/lib/apt/lists/*

ENV PHP_INI_DIR=/etc/php/${PHP_VERSION}/cli/conf.d
COPY conf.d/50_overrides.ini ${PHP_INI_DIR}/50_overrides.ini
COPY conf.d/01_newrelic.ini ${PHP_INI_DIR}/01_newrelic.ini

USER continua

CMD ["bash"]
