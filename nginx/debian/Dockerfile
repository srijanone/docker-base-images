ARG BASE_VERSION=buster
FROM srijanlabs/debian:${BASE_VERSION}

RUN mkdir /app && \
    chown -R kubedrop:kubedrop /app

EXPOSE 8080

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo "deb http://nginx.org/packages/debian buster nginx" > /etc/apt/sources.list.d/nginx.list \
    && curl -fsSL https://nginx.org/keys/nginx_signing.key |  apt-key add - \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nginx=1.18.0-1~buster \
    && rm -rf /var/lib/apt/lists/* 

COPY nginx.conf /etc/nginx/nginx.conf 
COPY default.conf /etc/nginx/conf.d/default.conf

RUN sed -i -r "s/\/nginx.pid/\/nginx\/nginx.pid/g" /etc/logrotate.d/nginx

RUN mkdir /var/run/nginx \
    mkdir -p /var/cache/nginxfastcgi \
    && chown -R kubedrop:kubedrop \
        /var/log \
        /var/cache/nginx \
        /var/run/nginx \
        /var/cache/nginxfastcgi \
        /etc/nginx/conf.d \
        /etc/logrotate.d/nginx
        
USER kubedrop

CMD [ "nginx"]
