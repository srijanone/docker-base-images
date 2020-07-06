# php-fpm image

ENTRYPOINT: bash
CMD: php-fpm -F (start php-fpm in forground)

Arguments:
Name | Default value | description
---|---|---|
BASE_VERSION| 10 | debian version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Default value | description
---|---|---|
PHP_MEMORY_LIMIT| 128 | php process memory limit
PHP_INI_DIR | /etc/php/${PHP_VERSION}/fpm/conf.d | TODO
