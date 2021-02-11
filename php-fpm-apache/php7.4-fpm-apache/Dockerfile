ARG PHP_VERSION=7.4
ARG BASE_VERSION=buster
FROM srijanlabs/php-fpm:${PHP_VERSION}-${BASE_VERSION}

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apache2=2.4.38-3+deb10u4 \
        libapache2-mod-fcgid=1:2.3.9-4 \
    && a2enmod actions \
    && a2enmod proxy \
    && a2enmod rewrite \
    && a2enmod proxy_fcgi \
    && a2enmod headers \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start.sh

# Apache configurations
COPY app.conf /etc/apache2/sites-enabled/000-default.conf
COPY envvars ports.conf /etc/apache2/

EXPOSE 8080

ENV DOC_ROOT="/app/web" \
    PHP_HOST=localhost

RUN chmod -R 0777 /var/tmp \
    && mkdir -p /var/run/apache2 \
    && chown -R continua:continua \
        /var/log \
        /var/lib/apache2 \
        /etc/apache2 \
        /var/run/apache2

USER continua

CMD [ "start.sh" ]
