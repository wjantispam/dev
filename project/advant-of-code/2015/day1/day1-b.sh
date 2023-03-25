#!/usr/bin/env bash
#
: '
---- PART Two ----
Now, given the same instructions, find the position of the first character 
 that causes him to enter the basement (floor -1). The first character 
 in the instructions has position 1, the second character has position 2, and so on.

For example:

) causes him to enter the basement at character position 1.
()()) causes him to enter the basement at character position 5.
What is the position of the character that causes Santa to first enter the basement?

# DOTO Takeaways
# bash function sytnatx is function fname [()] compound-command [redirection]
# and it does not take position args like Python
#  i.e no need to have f($1) { echo print $1 }
#  you can just do f() { echo $1 } and use it as f 1stArg
'


#set -Eeuo pipefail

declare -a array
# array=( $(cat small_input.txt) )
array=( $(cat $1 ) )

function found() {
  [[ $1 -eq -1 ]] && return 0
}

pos=0
for idx in `seq 0 ${#array}`; do
  curr_char="${array:$idx:1}"
  #echo -n "checking $curr_char ..."
  if [[ $curr_char = '(' ]]; then
    ((pos++))
    echo "$curr_char $pos"
    # TODO: this doesn't exit
    # found $pos && ( echo "Found $idx"; exit 0; )
    if found $pos; then
      echo "Found $(( idx+1 ))"
      exit 0
    fi
  elif [[ $curr_char = ')' ]]; then
    ((pos--))
    echo "$curr_char $pos"
    if found $pos; then
      echo "Found $(( idx+1 ))"
      exit 0
    fi
  fi
done

