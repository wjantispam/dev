#/usr/bin/env bash
set -Eeuo pipefail
echo "Running Bash $BASH_VERSION"

A=($(<"$1"))
echo "${A[@]}"
