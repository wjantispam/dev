#!/usr/bin/env bash
E_PARAM=65
case "$1" in
  "") echo "Usage: ${0##*/} <filename>"; exit $E_PARAM;;
  -*) FILENAME=./$1;;
  * ) FILENAME=$1;;
esac


echo
echo "FILENAME=$FILENAME"
