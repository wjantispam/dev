#!/usr/bin/env bash

# You can do Base conversion like this
echo $(( 2#101011 )) 

E_WRONG_ARGS=85
script_parameters="-a -h -m -z"
#                  -a = all, -h = help, etc.

if [ $# -ne $Number_of_expected_args ]
then
  echo "Usage: `basename $0` $script_parameters"
  # `basename $0` is the script's filename.
  exit $E_WRONG_ARGS
fi

generate_list() {
  echo "one two three"
}

for word in $(generate_list); do
  echo $word
done

