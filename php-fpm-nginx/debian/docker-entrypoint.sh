#!/usr/bin/env sh
set -eu

envsubst '${PHP_HOST} ${DOC_ROOT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"