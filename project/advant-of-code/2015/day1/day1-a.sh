#!/usr/bin/env bash

: <<'EOD'
An opening parenthesis, (, means he should go up one floor, and a 
 closing parenthesis, ), means he should go down one floor.
The apartment building is very tall, and the basement is very deep; 
 he will never find the top or bottom floors.

For example:

(()) and ()() both result in floor 0.
((( and (()(()( both result in floor 3.
))((((( also results in floor 3.
()) and ))( both result in floor -1 (the first basement level).
))) and )())()) both result in floor -3.
To what floor do the instructions take Santa?
EOD


echo $1
up=$(grep -o '(' $1 | wc -l)
down=$(grep -o ')' $1 | wc -l)

d=$((up-down))
echo "up floor level = $d"

