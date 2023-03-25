#!/usr/bin/env bash
# passing string as stdin using python


x='foo bar baz'
echo "$x"

echo "====== method one using pipe"
echo "$x" | python3 -c 'import sys; print(sys.stdin.buffer.read())'

echo "====== method two using <<<"
python3 -c 'import sys; print(sys.stdin.buffer.read())' <<< "$x"
