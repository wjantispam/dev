#!/usr/bin/env bash
# Tips of reading input using while
#
while read  des what mask iface; do
  echo "-->" $des "-->" $what "-->" $mask "-->" $iface
done < <(route -n) 

echo =======================

# equivalent to the following
route -n |
  while read  des what mask iface; do
    echo "..>" $des "..>" $what "..>" $mask "..>" $iface
  done
