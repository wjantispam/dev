#!/usr/bin/env bash
# The aim of this test is to make sure only one script can run at any one time!
#   we simulate this by running this one after another to see if it works
# https://www.putorius.net/exec-command.html
# Bash 4.3 and older chokes on empty arrays with set -u.
#set -euo pipefail

this_arg="${BASH_SOURCE[0]:-$0}"
init_script_name="$(basename "$this_arg")"
[ -h "$this_arg" ] && init_script_name="$(basename "$(readlink -- "$this_arg")")"
script_dir=$(cd "$(dirname "$this_arg")" &>/dev/null && pwd -P)
init_script_name_noext="${init_script_name%.*}"
log="${init_script_name_noext}.log"

require() { if ! [ -x "$(command -v "$*")" ]; then echo "$* is available and executable"; \
     else echo "Unable to find $*, Exiting ..."; exit 69; fi; }
println() { printf '%s\n' "$*"; }
tmpfile="$(mktemp -t myprog-XXXXXX)"
cleanup() { rm -f "$tmpfile"; }
trap cleanup EXIT # always cleanup the tmp file on exit

require println
require cleanup

lockfile="${init_script_name_noext}.lock"
println "lockfile is $lockfile"

exec 100>"$lockfile" || exit 1
flock -n 100 || exit 1
trap 'rm -f ${lockfile}' EXIT
echo "Checking if file exists"

# Now we run the most important task that is going to take a while
echo "$(date +%T) I'm running this"
sleep 10

# Try to run this again?

exit 0

