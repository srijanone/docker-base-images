ARG PHP_TAG
FROM srijanlabs/php-fpm:${PHP_TAG}

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apache2 \
    libapache2-mod-fcgid \
    && a2enmod actions \
    && a2enmod proxy \
    && a2enmod rewrite \
    && a2enmod proxy_fcgi \
    && rm -rf /var/lib/apt/lists/*


# Apache configurations
COPY app.conf /etc/apache2/sites-enabled/000-default.conf
COPY envvars /etc/apache2/envvars
COPY ports.conf /etc/apache2/ports.conf

EXPOSE 8080

RUN mkdir /var/run/apache2 \
    && chown -R continua:continua /var/run/apache2 \
    && chmod -R 0777 /var/tmp \
    && chown -R continua:continua /var/log \
    && chown -R continua:continua /etc/apache2 \
    && chown -R continua:continua /var/lib/apache2

USER continua
