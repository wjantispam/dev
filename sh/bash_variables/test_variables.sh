#!/usr/bin/env bash
#set -euo pipefail
# Bash 4.2 supports an actual test for the presence of a variable 
#   rather than testing the value of the variable.
# Ref: https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
#      https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html

echo "How to check if a variable is set in Bash?"
echo "Test: when test var not set"

[ -z ${var+x} ] && echo "var is unset" || echo "var is set to '$var'"
[[ -v var ]] && echo "var is set to '$var'" || echo "var is unset" 
[ -n "$var" ] && echo "var is set to '$var'" || echo "var is unset" 

echo "Test: set var="
var=
[ -z ${var+x} ] && echo "var is unset" || echo "var is set to '$var'"
[[ -v var ]] && echo "var is set to '$var'" || echo "var is unset" 
[ -n "$var" ] && echo "var is set to '$var'" || echo "var is unset" 

echo "Test: set var="" a NULL value"
var=""
[ -z ${var+x} ] && echo "var is unset" || echo "var is set to '$var'"
[[ -v var ]] && echo "var is set to '$var'" || echo "var is unset" 
[ -n "$var" ] && echo "var is set to '$var'" || echo "var is unset" 

echo "Test: set var=" " an Empty String value"
var=" "
[ -z ${var+x} ] && echo "var is unset" || echo "var is set to '$var'"
[[ -v var ]] && echo "var is set to '$var'" || echo "var is unset" 
[ -n "$var" ] && echo "var is set to '$var'" || echo "var is unset" 




[[ -v PWD ]]

echo "can you see this?"
exit 0