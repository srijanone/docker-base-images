ARG PHP_VERSION=7.2
FROM srijanlabs/php:${PHP_VERSION}-1.x

ENV PHP_MEMORY_LIMIT=256M

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    git \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

USER continua

CMD ["bash"]
