#!/usr/bin/env bash
declare -a colors

colors=( $(cat $1) )
echo "colors=${colors[@]}"
elememt_count=${#colors[@]}
echo the total $elememt_count

index=0

echo "============"
# BAGA: You don't need $ inside ${} for the variable
set -v
echo ${colors[$index]}
echo ${colors[index]}
set +v

array_math=( $(cat $1) )

# TODO: we have to be clever on the int size
for size in ${array_math[@]}; do
  x=${size:0:1}
  y=${size:2:1}
  # BAGA: If input is 1x1x10 then z is 1, 
  z=${size:4:1}
  let "out = x*y*x" 
  echo "current $size, and total = $out ...."
done

for size in ${array_math[@]}; do
  x=$(echo $size | cut -d 'x' -f 1)
  y=$(echo $size | cut -d 'x' -f 2)
  z=$(echo $size | cut -d 'x' -f 3)
  let "out = x*y*x" 
  echo "current $size, and total = $out ...."
done






