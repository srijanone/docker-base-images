ARG PHP_VERSION=7.2
ARG BASE_VERSION=buster
FROM srijanlabs/php:${PHP_VERSION}-${BASE_VERSION}
ARG PHP_VERSION=7.2

# Expecting latest version
# hadolint ignore=DL3008
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php${PHP_VERSION}-fpm \
    # This is clunky :).
    && ln -sf /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm \
    && rm -rf /var/lib/apt/lists/*

ENV PHP_INI_DIR=/etc/php/${PHP_VERSION}/fpm/conf.d \
    PHP_FPM_REQUEST_TIMEOUT=180

COPY php-fpm.conf /etc/php/${PHP_VERSION}/fpm/php-fpm.conf
COPY conf.d/50_fpm.ini ${PHP_INI_DIR}/50_fpm.ini
COPY conf.d/01_newrelic.ini ${PHP_INI_DIR}/01_newrelic.ini
COPY conf.d/50_overrides.ini ${PHP_INI_DIR}/50_overrides.ini

EXPOSE 9000

USER continua

ENV PATH=/app/vendor/bin:$PATH

ENV PHP_FPM_PORT=9000 \
    PHP_FPM_MAX_CHILDREN=20 \
    PHP_FPM_START_SERVERS=2 \
    PHP_FPM_MIN_SPARE_SERVERS=2 \
    PHP_FPM_MAX_SPARE_SERVERS=10 \
    PHP_FPM_MAX_REQUESTS=500

CMD ["php-fpm", "-F"]
