ARG PHP_VERSION=7.2
FROM srijanlabs/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php${PHP_VERSION}-fpm

# COPY conf.d/50_fpm.ini /etc/php/conf.d/50_fpm.ini
# COPY php-fpm.conf /etc/php/php-fpm.conf

EXPOSE 9000

USER continua

# Configuration which can be overriden.
# See /etc/php/php-fpm.confRUN apk --updateRUN apk --update --no-cache add \ --no-cache add \
ENV PHP_FPM_PORT=9000 \
    PHP_FPM_MAX_CHILDREN=20 \
    PHP_FPM_START_SERVERS=2 \
    PHP_FPM_MIN_SPARE_SERVERS=2 \
    PHP_FPM_MAX_SPARE_SERVERS=10 \
    PHP_FPM_MAX_REQUESTS=500

CMD ["php-fpm", "-F"]
