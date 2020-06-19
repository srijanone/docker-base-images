# php-fpm-apache

ENTRYPOINT: bash
CMD: start.sh [php-fpm and apache2]


Aeguments:
Name | Defailt value | description
---|---|---|
PHP_TAG| 

Environment variables:
Name | Defailt value | description
---|---|---|
DOC_ROOT| /app/web | from where index.php is loaded
PHP_HOST| localhost | php-fpm server hostname
