# !/usr/bin/env bash

# er application is checking for a lock file:

if (set -C; : > lock_file) 2> /dev/null
then
  echo "Another user is already running that script."
  exit 65
fi   

