FROM srijanlabs/base:1.x

ENV CA_VERSION=20190110

RUN mkdir /app && \
    chown -R continua:continua /app

WORKDIR /app

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

EXPOSE 8080

RUN mkdir /var/run/apache2 \
    && chown -R continua:continua /var/run/apache2 \
    && chmod -R 0777 /var/tmp \
    && chown -R continua:continua /var/log

CMD apache2ctl -D FOREGROUND
