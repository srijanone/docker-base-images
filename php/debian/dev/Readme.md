# php dev image

php dev image is suitable only for local environents. It comes with blackfire and
xdebug enabled which come handy for profiling and debugging.

Arguments:
Name | Default value | description
---|---|---|
BASE_VERSION| 10 | debian version
PHP_VERSION | 7.2 | php version

Environment variables:
Name | Default value | description
---|---|---|
PHP_MEMORY_LIMIT| 512M | php process memory limit
PHP_UPLOAD_MAX_FILESIZE| 20M | php upload max filesize
PHP_MAX_EXECUTION_TIME| 512 | php max execution time
XDEBUG_ENABLE | 0 | Enable php debugger 
