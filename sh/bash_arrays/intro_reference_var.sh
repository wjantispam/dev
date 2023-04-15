#!/usr/bin/env bash

realvariable=contents
ref=realvariable
echo "${!ref}"   # prints the contents of the real variable

printf "%s\n" "Indirect reference a list of variables"
#realarray=(for i in {1..20}; do echo $i; done) # TODO: could be nice to define the list like this
realarray=(host1 host2 host3 host4)
ref=realarray
index=2
tmp=${ref}[index]
echo "${!tmp}"            # gives array element [2]
