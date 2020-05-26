ARG PHP_VERSION=7.2
FROM srijanlabs/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php${PHP_VERSION}-fpm \
    # This is clunky :).
    && ln -sf /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm \
    && rm -rf /var/lib/apt/lists/*

COPY conf.d/50_fpm.ini /etc/php/${PHP_VERSION}/conf.d/50_fpm.ini
COPY php-fpm.conf /etc/php/${PHP_VERSION}/fpm/php-fpm.conf

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
