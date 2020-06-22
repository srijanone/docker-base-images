# php-fpm-apache

ENTRYPOINT: bash
CMD: start.sh [php-fpm and apache2]


Aeguments:
Name | Default value | description
---|---|---|
BASE_VERSION| 10 | debioan version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Default value | description
---|---|---|
DOC_ROOT| /app/web | from where index.php is loaded
PHP_HOST| localhost | php-fpm server hostname
