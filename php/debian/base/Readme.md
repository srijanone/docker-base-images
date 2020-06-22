# php base image

ENTRYPOINT: bash
CMD: -


Aeguments:
Name | Defailt value | description
---|---|---|
BASE_VERSION| 10 | debioan version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Defailt value | description
---|---|---|
PHP_MEMORY_LIMIT| 128 | php process memory limit
SYSLOG_SYMLINK | /mnt/syslog/log | TODO
NEW_RELIC_ENABLED | false | newrelic switch
NEW_RELIC_APP_NAME | not set | newrelic application name
NEW_RELIC_LICENSE_KEY | not set | newrelic license key
