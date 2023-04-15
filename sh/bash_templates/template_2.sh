#!/usr/bin/env bash
#  [% VIM_TAGS %]
#
#  Author: Hari Sekhon
#  Date: [% DATE # 2008-10-20 16:20:39 +0100 (Mon, 20 Oct 2008) %]
#
#  [% URL %]
#
#  [% LICENSE %]
#
#  [% MESSAGE %]
#
#  [% LINKEDIN %]
#

# Bash 4.3 and older chokes on empty arrays with set -u.
set -euo pipefail

#### Useful Functions not sourced from my own library
# Assert that command dependencies are installed
#  $ require nampstatus # If you don't have this tool then exit!
require() { if ! [ -x "$(command -v "$*")" ]; then echo "$* is available and executable"; \
     else echo "Unable to find $*, Exiting ..."; exit 69; fi; }
println() { printf '%s\n' "$*"; }
tmpfile="$(mktemp -t myprog-XXXXXX)"
cleanup() { rm -f "$tmpfile"; }
trap cleanup EXIT # always cleanup the tmp file on exit

require println
require cleanup

[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090
. "$srcdir/lib/utils.sh"

# shellcheck disable=SC2034,SC2154
usage_description="
TODO: DESCRIPTION
"

# used by usage() in lib/utils.sh
# shellcheck disable=SC2034
usage_args="arg [<options>]"

host="${BLAH_HOST:-${HOST:-localhost}}"
port="${BLAH_PORT:-${PORT:-80}}"

check_env_defined "API_TOKEN"

help_usage "$@"

min_args 1 "$@"

until [ $# -lt 1 ]; do
    case $1 in
    -H|--host)  host="${2:-}"
                shift || :
                ;;
    -P|--port)  port="${2:-}"
                shift || :
                ;;
    -h|--help)  usage
                ;;
            *)  usage "unknown argument: $1"
                ;;
    esac
    shift || :
done

if [ -z "$host" ]; then
    usage "--host not defined"
elif [ -z "$port" ]; then
    usage "--port not defined"
fi

exit 0