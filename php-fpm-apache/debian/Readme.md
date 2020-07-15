# php-fpm-apache

ENTRYPOINT: bash
CMD: start.sh [php-fpm and apache2]


Aeguments:
Name | Default value | description
---|---|---|
BASE_VERSION| 10 | debian version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Default value | description
---|---|---|
DOC_ROOT| /app/web | from where index.php is loaded
PHP_HOST| localhost | php-fpm server hostname
PHP_FPM_PORT| 9000 | php-fpm listening port
PHP_MEMORY_LIMIT| 128M | php process memory limit
PHP_UPLOAD_MAX_FILESIZE| 10M | php upload max filesize
PHP_MAX_EXECUTION_TIME| 180 | php max execution time
PHP_INI_SCAN_DIR | /etc/php/${PHP_VERSION}/cli/conf.d | path for extra php modules configuration
