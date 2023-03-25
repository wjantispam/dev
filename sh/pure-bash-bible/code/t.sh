#!/usr/bin/env bash
# Just to try different ways to debug
#   and learn to use trap ... DEBUG
#   I find it is better to use set -x or set -vx
#   the PS4 is useful to know which line it runs on
#
trap 'echo Debug: ' DEBUG
#
#
variable=29; line=$LINENO

echo "  Just initialized \$variable to $variable in line number $line."

let "variable *= 3"; line=$LINENO
echo "  Just multiplied \$variable by 3 in line number $line."


echo "======================"
export PS4="\$LINENO>"
# set -x
foo(){
  echo `basename $0`
}

foo

main(){
  echo "running func from main"
  foo
}
main
echo "......................"
