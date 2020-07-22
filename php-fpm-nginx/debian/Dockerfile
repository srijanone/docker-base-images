ARG PHP_VERSION=7.2
ARG BASE_VERSION=buster
FROM srijanlabs/php-fpm:${PHP_VERSION}-${BASE_VERSION}

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo "deb http://nginx.org/packages/debian buster nginx" > /etc/apt/sources.list.d/nginx.list \
    && curl -fsSL https://nginx.org/keys/nginx_signing.key |  apt-key add - \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nginx=1.18.0-1~buster \
    gettext-base=0.19.8.1-9 \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /usr/local/bin/start.sh
COPY docker-entrypoint.sh /usr/local/bin/

COPY nginx.conf /etc/nginx/nginx.conf 
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

EXPOSE 8080

ENV DOC_ROOT="/app/web" \
    PHP_HOST=localhost

RUN mkdir /var/run/nginx \
    mkdir -p /var/cache/nginxfastcgi \
    && chown -R continua:continua \
        /var/log \
        /var/cache/nginx \
        /var/run/nginx \
        /var/cache/nginxfastcgi \
        /usr/share/nginx \
         /etc/nginx/conf.d \
        /etc/logrotate.d/nginx
        
RUN sed -i -r "s/\/nginx.pid/\/nginx\/nginx.pid/g" /etc/logrotate.d/nginx

ENV DOC_ROOT="/usr/share/nginx/html" \
    PHP_HOST=localhost
        
USER continua

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "start.sh" ]
