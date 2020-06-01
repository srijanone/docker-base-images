ARG PHP_VERSION=7.2
FROM srijanlabs/php:${PHP_VERSION}-1.x

ENV PHP_MEMORY_LIMIT=256M

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    git=1:2.20.1-2+deb10u3 \
    patch=2.7.6-3+deb10u1 \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && rm -rf /var/lib/apt/lists/*

USER continua

CMD ["bash"]
