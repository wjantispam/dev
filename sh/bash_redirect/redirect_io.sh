#!/usr/bin/env bash
# Try some redirects

srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
srcname="${BASH_SOURCE[0]}"
echo "srcdir: $srcdir, srcname: $srcname"
function show_usage() {
    echo "Usage:"
    echo "    -v: verbose"
    show_an_error_here
}

# Display the output to terminal
show_usage

echo "-----------------------------------------"
echo " > ${srcname}.out 2> $srcname.err: Send output and err to files" 
show_usage > ${srcname}.out 2> $srcname.err

echo "-----------------------------------------"
echo "2>&1: hide stdout and direct stderr to it (also hide it)"
show_usage > /dev/null 2>&1

echo "-----------------------------------------"
echo ">&2: direct stdout to stderr"
show_usage >&2
