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

# BAGA:
# awk syntax
# awk -F '' '{BEGIN {...} {...MAIN CODE....} END {...}}'
#
# just like bash, it uses ; to end a statement
# You can define your own function with syntax
# func name(arg1, arg2 ..) { .... return ...}
#

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


