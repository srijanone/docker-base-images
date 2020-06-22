#!/bin/bash

# Start the first process
# ./my_first_process -D
php-fpm -F &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php-fpm : $status"
  exit $status
fi

# Start the second process
# ./my_second_process -D
apache2ctl -D FOREGROUND &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start apache2 : $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 15; do
  # If the greps find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  ps aux |grep php-fpm|grep -q -v grep
  if [ $? -ne 0 ]; then
    echo "php-fpm has already exited."
    exit 1
  fi
  ps aux |grep apache |grep -q -v grep
  if [ $? -ne 0 ]; then
    echo "apache has already exited."
    exit 1
  fi
done
