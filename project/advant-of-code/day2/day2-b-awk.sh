#!/usr/bin/env bash
#
# The elves are also running low on ribbon. Ribbon is all the same width, so they
# only have to worry about the length they need to order, which they would again
# like to be exact.

# The ribbon required to wrap a present is the shortest distance around its sides,
# or the smallest perimeter of any one face. Each present also requires a bow made
# out of ribbon as well; the feet of ribbon required for the perfect bow is equal to
# the cubic feet of volume of the present. Don't ask how they tie the bow, though;
# they'll never tell.

# For example:

#   A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap
#   the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.
#   A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to wrap
#   the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total of 14 feet.
#   
#   How many total feet of ribbon should they order?
  

# sort(a, b, c)
# TODO: can awk handle direct swap?
# Looks like I have to do: awk 'BEGIN {a=3;b=4} {tmp=b; b=a; a=tmp; print a b} '
#
awk -F 'x' '
  func max3(a,b,c) {
    max=a
    max = (max > b ? max : b)
    max = (max > c ? max : c)
    return max
  }
  BEGIN {TOTAL=0; MIN=0} 
  { 
    x=$1; 
    y=$2;
    z=$3; 
    d=2*x+2*y+2*z-2*max3(x,y,z);
    k=x*y*z+d;
    print "Current " $0 "\n" k ", wrap=" d "\n"; TOTAL+=k
  };
    
  END {print "===>" TOTAL}
' $1


# ❯ cat day2_input_small.txt | awk -F 'x'  'BEGIN {TOTAL=0; MIN=0} { x=2*$1*$2; y=2*$1*$3; z=2*$2*$3; k=x+y+z; print "Current " $0 "\n" k "min=" d "\n"; TOTAL+=k}; END {print "===>" TOTAL}'
exit 0
