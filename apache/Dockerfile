FROM srijanlabs/base:1.x

RUN mkdir /app && \
    chown -R continua:continua /app

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates=20190110 \
    apache2=2.4.38-3+deb10u3 \
    libapache2-mod-fcgid=1:2.3.9-4 \
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
    && chown -R continua:continua /var/log \
    && chown -R continua:continua /etc/apache2 \
    && chown -R continua:continua /var/lib/apache2

CMD [ "apache2ctl", "-D", "FOREGROUND"]
