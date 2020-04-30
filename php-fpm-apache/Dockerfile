ARG PHP_TAG
FROM srijanlabs/php-fpm:${PHP_TAG}

ENV CA_VERSION=20190110

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates=${CA_VERSION} \
    apache2 \
    libapache2-mod-fcgid \
    && a2enmod actions \
    && a2enmod proxy \
    && a2enmod rewrite \
    && a2enmod proxy_fcgi \
    && rm -rf /var/lib/apt/lists/*

COPY ports.conf /etc/apache2/ports.conf
COPY start.sh /usr/local/bin/start.sh

EXPOSE 8080

RUN mkdir /var/run/apache2 \
    && chown -R continua:continua /var/run/apache2 \
    && chmod -R 0777 /var/tmp \
    && chown -R continua:continua /var/log \
    && setcap cap_net_bind_service=+epi /usr/sbin/apache2ctl
    
USER continua

CMD start.sh
