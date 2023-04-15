#!/usr/bin/env bash
# Why we should use ${array[*]}
# Ref:  https://stackoverflow.com/questions/55149641/best-practice-print-an-array-in-a-bash-script
#    
# shellcheck disable=SC2145
declare -a  deleted
deleted=("some.id.1" "some.id.22" "some.id.333")
echo "There is no difference in echo but printf is a problem!"
echo "List of fields deleted: ${deleted[@]}"
echo "List of fields deleted: ${deleted[*]}"
echo
echo "\${deleted[@]} expansion is a seperate words"
echo "with array expansion, you'd usually expand it to be a single word instead"
echo "===> BAD \${deleted[@]} ! <======"
printf "%s\n" "List of fields deleted: ${deleted[@]}"
echo "===> Good \${deleted[*]} <===="
printf "%s\n" "List of fields deleted: ${deleted[*]}"

# TODO: I don't understand why SC2145 think print them seperately is good
echo
echo "===> Good? \${deleted[@]} <======"
printf "%s\n" "List of fields deleted:" "${deleted[@]}"
echo "===> Good? \${deleted[*]} <======"
printf "%s\n" "List of fields deleted:" "${deleted[*]}"

exit 0