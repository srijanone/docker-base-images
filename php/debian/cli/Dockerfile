ARG PHP_VERSION=7.4
ARG BASE_VERSION=buster
FROM srijanlabs/php:${PHP_VERSION}-${BASE_VERSION}

ARG COMPOSER_VERSION=2.0.9
ARG PHP_VERSION=7.4

ENV PHP_MEMORY_LIMIT=256M \
    PHP_MAX_EXECUTION_TIME=300

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    git  \
    patch \
    unzip \
    && curl -sS https://getcomposer.org/installer -o installer \
    && php installer --version="${COMPOSER_VERSION}" && rm -rf installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && rm -rf /var/lib/apt/lists/*

ENV PHP_INI_DIR=/etc/php/${PHP_VERSION}/cli/conf.d
COPY conf.d/50_overrides.ini ${PHP_INI_DIR}/50_overrides.ini
COPY conf.d/01_newrelic.ini ${PHP_INI_DIR}/01_newrelic.ini

USER kubedrop

CMD ["bash"]
