ARG BASE_VERSION=buster
FROM srijanlabs/debian:${BASE_VERSION}

RUN mkdir /app && \
    chown -R kubedrop:kubedrop /app

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apache2 \
    libapache2-mod-fcgid \
    krb5-user \
    libapache2-mod-auth-kerb \
    && a2enmod actions \
    && a2enmod proxy \
    && a2enmod rewrite \
    && a2enmod proxy_fcgi \
    && a2enmod auth_kerb \
    && rm -rf /var/lib/apt/lists/*

COPY ports.conf /etc/apache2/ports.conf
COPY envvars /etc/apache2/envvars

EXPOSE 8080

RUN mkdir -p /var/run/apache2 \
    && chown -R kubedrop:kubedrop /var/run/apache2 \
    && chmod -R 0777 /var/tmp \
    && chown -R kubedrop:kubedrop /var/log \
    && chown -R kubedrop:kubedrop /etc/apache2 \
    && chown -R kubedrop:kubedrop /var/lib/apache2

USER kubedrop

CMD [ "apache2ctl", "-D", "FOREGROUND"]
