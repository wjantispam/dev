#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
SCRIPT_FILENAME="$(readlink -f "${0}")"
SCRIPT_PATH="$(dirname "${SCRIPT_FILENAME}")"
DOTFILES_PATH="${SCRIPT_PATH}/.."

echo "$SCRIPT_FILENAME"
echo "$SCRIPT_PATH"

simple() {
    echo "just a simple fun"
    echo "Input is $1"
}

simple Hello

