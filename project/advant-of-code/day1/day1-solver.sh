#!/usr/bin/env bash

echo $1
up=$(grep -o '(' $1 | wc -l)
down=$(grep -o ')' $1 | wc -l)

d=$((up-down))
echo "up floor level = $d"

