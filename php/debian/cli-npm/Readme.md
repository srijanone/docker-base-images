# php-cli image

ENTRYPOINT: bash
CMD: bash

Arguments:
Name | Default value | description
---|---|---|
BASE_VERSION| 10 | debian version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Default value | description
---|---|---|
PHP_MEMORY_LIMIT| 256M | php process memory limit
PHP_MAX_EXECUTION_TIME| 300 | php max execution time
PHP_INI_DIR | /etc/php/${PHP_VERSION}/cli/conf.d | TODO
