ARG IMAGE=srijanlabs/php:7.2-1.x
# hadolint ignore=DL3006
FROM ${IMAGE}

ARG PHP_VERSION=7.2

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
    && rm -rf /tmp/blackfire /tmp/blackfire-probe.tar.gz

COPY conf.d/01_blackfire.ini /etc/php/${PHP_VERSION}/fpm/conf.d/01_blackfire.ini
COPY conf.d/50_dev.ini /etc/php/${PHP_VERSION}/fpm/conf.d/50_dev.ini
COPY conf.d/01_xdebug.ini /etc/php/${PHP_VERSION}/fpm/conf.d/01_xdebug.ini

USER continua
