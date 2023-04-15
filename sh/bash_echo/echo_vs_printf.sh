#!/usr/bin/env bash
#set -euo pipefail
# It is safter to use printf (more typing)
#   Unfortunatelly it is not safe to redefine echo
#   for verifiability's sake, better leave echo forever broken
test_printf() {
    echo "Testing printf ============"
    printf '%s\n' "$var"
    printf '%s' "$var"
    printf '%s\r' "$var"
    printf '%s\n' "${var[*]}"
}

test_echo() {
    echo "Testing echo ============"
    echo "$var"
    echo -n "$var"
    echo -en "$var\r"
    echo "${var[@]}"
}

var="simple var"
test_echo
test_printf


var="--simple var"
test_echo
test_printf

var=(this that he and she)
test_echo
test_printf

exit 0
