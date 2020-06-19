# php cli image

ENTRYPOINT: bash
CMD: bash


Aeguments:
Name | Defailt value | description
---|---|---|
BASE_VERSION| 10 | debioan version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Defailt value | description
---|---|---|
PHP_MEMORY_LIMIT| 256 | php process memory limit
PHP_INI_SCAN_DIR | /etc/php/${PHP_VERSION}/cli/conf.d | TODO
