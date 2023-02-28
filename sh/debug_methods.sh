#!/usr/bin/env bash


P4='$(read time junk < /proc/$$/schedstat; echo "@@@ $time @@@ " )'
# Per suggestion by Erik Brandsberg.
set -x
# Various commands follow ...

for i in {0..10}; do
	echo -n $i
done

