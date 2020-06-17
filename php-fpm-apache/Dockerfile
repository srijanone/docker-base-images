ARG PHP_TAG
FROM srijanlabs/php-fpm:${PHP_TAG}

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apache2=2.4.38-3+deb10u3 \
        libapache2-mod-fcgid=1:2.3.9-4 \
    && a2enmod actions \
    && a2enmod proxy \
    && a2enmod rewrite \
    && a2enmod proxy_fcgi \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start.sh

# Apache configurations
COPY app.conf /etc/apache2/sites-enabled/000-default.conf
COPY envvars ports.conf /etc/apache2/

EXPOSE 8080

ENV DOC_ROOT="/app/web" \
    PHP_HOST=localhost

RUN chmod -R 0777 /var/tmp \
    && chown -R continua:continua \
        /var/log \
        /var/lib/apache2 \
        /etc/apache2

USER continua

CMD [ "start.sh" ]
