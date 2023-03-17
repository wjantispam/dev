#!/usr/bin/env bash
#
#
variable=29; line=$LINENO

echo "  Just initialized \$variable to $variable in line number $line."

let "variable *= 3"; line=$LINENO
echo "  Just multiplied \$variable by 3 in line number $line."

foo(){
  echo `basename $0`
}
echo "running food"
foo

main(){
  echo "running func from main"
  foo
}
echo "running main"
main
