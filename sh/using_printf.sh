#!/usr/bin/env bash
E_BADDIR=85

var=nonexist_dir

error() {
  printf "You can discard these\n%s" "$@"
  printf "$@" >&2
  echo
  exit $E_BADDIR
}

cd $var || error "can't cd to %s" "$var"
