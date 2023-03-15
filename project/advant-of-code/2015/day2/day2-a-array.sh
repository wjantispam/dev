#!/usr/bin/env bash
#
# calculating the required wrapping paper for each gift a little easier: find
# every present is a box (a perfect right rectangular prism), which makes
# the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also
# need a little extra paper for each present: the area of the smallest side.

# For example:

#   A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of
#   wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
#   A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square
#   feet of wrapping paper plus 1 square foot of slack, for a total of 43
#   square feet.  All numbers in the elves' list are in feet. How many total
#   square feet of wrapping paper should they order?

E_ARGS=65

INPUTFILE=$1
# TODO: Why this didn't exit the script, because it is in a subshell?
# [[ -f $INPUTFILE ]] || ( echo "ERROR: File ${INPUTFILE} not found!"; exit $ARGS; )
# [[ -f $INPUTFILE ]] || ( echo "ERROR: File ${INPUTFILE} not found!"; return $ARGS; )
# echo "return $?"

array_math=$( cat $INPUTFILE )
#
# BAGA:
# Bash function does not begin with def!
# It do not need any positional args when defining it
# It doesn't have a return value?
# also when you call it you don't need call it like fun(), just fun arg1 arg2

# TODO: Can you handle n input (implement a sort function)?
function min() {
  # calculate the min of three numbers
  local h=$1
  local w=$2
  local l=$3
  local min_side=$h
  
  [[ $w -lt $min_side ]] && min_side=$w
  [[ $l -lt $min_side ]] && min_side=$l
  # BAGA: Bash return is different to Python's return
  # return $min_side
  echo $min_side
}

# TODO: 
# Approach 1:  load all into an array - still slow
function solver1() {
  for size in ${array_math[@]}; do
    h=$(echo $size | cut -d 'x' -f 1)
    w=$(echo $size | cut -d 'x' -f 2)
    l=$(echo $size | cut -d 'x' -f 3)
    let "area1 = h*w"
    let "area2 = h*l"
    let "area3 = l*w"
    # get the min side of all sides
    small_area=$(min $area1 $area2 $area3)
    let "size_wrapping_paper = 2*(area1+area2+area3)+small_area" 
    # echo "current $size, small_area = $small_area and total = $size_wrapping_paper ...."
    let "ans += $size_wrapping_paper" 
  done
  echo "==> $ans"
}

time solver1

# Approach 2: Read file line by line and run calculation 
function calculate_size() {
  local line=($1)
  for size in ${line[@]}; do
    h=$(echo $size | cut -d 'x' -f 1)
    w=$(echo $size | cut -d 'x' -f 2)
    l=$(echo $size | cut -d 'x' -f 3)
    let "area1 = h*w"
    let "area2 = h*l"
    let "area3 = l*w"
    # get the min side of all sides
    small_area=$(min $area1 $area2 $area3)
    let "ans = 2*(area1+area2+area3)+small_area" 
    # echo "current $size, small_area = $small_area and total = $size_wrapping_paper ...."
    # let "ans += $size_wrapping_paper" 
    echo "$ans"
  done 
}

function solver2() {
  while read line; do
    ans=0
    # echo $line

    s=$(calculate_size $line)
    let "total+=$s"
  done <$INPUTFILE
  echo "====> $total"
}

time solver2

# ❯ ./day2-a-array.sh day2_input.txt               
# Solver1
# ==> 1606483                                      
#                                                  
# real    0m5.145s                                 
# user    0m6.265s                                 
# sys     0m1.090s                                 
# Solver2
# ====> 1606483                                    
#                                                  
# real    0m5.375s                                 
# user    0m6.873s                                 
# sys     0m0.514s
