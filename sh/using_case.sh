#!/usr/bin/env bash
# Bash style guide

# TODO: We might want error based on different critical level
info() {
	echo "[$(date +'%Y-%m-%dT%H:%M:%s')] INFO: $*"	>&2
}

err() {
	echo "[$(date +'%Y-%m-%dT%H:%M:%s')] ERROR: $*"	>&2
}

#if ! do_something; then
#	err 'unahle to do something'
#	exit 1;
#fi

verbose='false'

bflag=''
files=''
while getopts 'abf:v' flag; do
  case "${flag}" in
    a) aflag='true' echo "aflag is $1";;
    b) bflag='true' ;;
    f) files="${OPTARG}" ;;
    v) verbose='true' ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

echo; echo "Hit a key, then hit return"
read Keypress

case "$Keypress" in
	[[:lower:]] ) echo "Lowercase letter";;
	[[:upper:]] ) echo "Uppercase letter";;
	[0-9] 			) echo "Digit";;
	* 					) echo "Punctuation, whitespace or other";;
esac


