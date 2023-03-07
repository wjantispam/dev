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

ARGS=65
#
# BAGA:
# Bash function not begin with def!
# It doesn't have a return value?
function calculate_size() {
  a=$1
  b=$2
  c=$3
  # let "size = 2*a*b+2*b*c+2*a*c"
  # echo $size
  # return $((2*a*b+2*b*c+2*a*c))
  echo $((2*a*b+2*b*c+2*a*c))
}

echo $(calculate_size 1 2 4)

# cat day2_input_small.txt | awk -F 'x'  'BEGIN {TOTAL=0} { y=(($1*$2*$3)); print "Current " $0 "\n" $y "\n"; TOTAL+=y}; END {print $TOTAL}'

INPUTFILE=$1
# TODO: Why this didn't exit the script, because it is in a subshell?
[[ -f $INPUTFILE ]] || ( echo "ERROR: File ${INPUTFILE} not found!"; exit $ARGS; )


while read line; do
  echo $line
  # declare -i a
  # Need something like this
  # (a,b,c)=$(awk -F 'x' '{print $1 " " $2 " " $3}' day2_input_small.txt)
  # calling permutation function
  # split each line into three parts, and permutate them
done <$1

awk -F 'x' '
  func min3(a,b,c) {
    min=a
    min = (min < b ? min : b)
    min = (min < c ? min : c)
    return min
  }
  BEGIN {TOTAL=0; MIN=0} 
  { 
    x=2*$1*$2; 
    y=2*$1*$3;
    z=2*$2*$3; 
    d=min3(x,y,z);
    k=x+y+z+d/2;
    print "Current " $0 "\n" k ", min=" d "\n"; TOTAL+=k
  };
    
  END {print "===>" TOTAL}
' $1


# ❯ cat day2_input_small.txt | awk -F 'x'  'BEGIN {TOTAL=0; MIN=0} { x=2*$1*$2; y=2*$1*$3; z=2*$2*$3; k=x+y+z; print "Current " $0 "\n" k "min=" d "\n"; TOTAL+=k}; END {print "===>" TOTAL}'
