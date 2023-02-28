#!/usr/bin/env bash

# If there are not 1st position arg then it will print:
#+./foo.sh: line 3: 1: Usage: ./foo.sh ARGUMENT
echo ${1?"Usage: $0 ARGUMENT"}


# ? can be used to evaluate if a parameter is set
#+ it will print error if the first one found is not set
echo ${HOSTNAME?} ${USER?} ${MAIL?}
