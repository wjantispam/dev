#!/usr/bin/env bash
# Create a folder for the new day and add some boilderplates files

NO_ARGS=0
E_OPTERROR=85
WORKING_DIR="/home/dean/main/dev/project/advant-of-code/2018"
FLAG_DRY=1  # Do dry-run by default


function usage(){
  echo "Usage `basename $0` [-r|-h] foldername/day1/day10/)"
  # echo "Usage: $(basename $0) <Day1 or Day20 etc.>" && grep ") #" $0 | grep -v "grep"
  exit 0
}

# Handles no input args
[[ $# -eq "$NO_ARGS" ]] && usage

# see man bash, and https://wiki.bash-hackers.org/howto/getopts_tutorial
# getopts OPTSTRING VARNAME [ARGS...]
# getopts fAx VARNAME for it to look for -f -A -x, so you can do
#    t.sh -f or t.sh -A or t.sh -fAx or t.sh -Axf etc.
# getopts fA:x VARNAME the : after A means it expected an argument
#    t.sh -f -A SOMETHING
# getopts :fA:x VARNAME the first : is to switches to "silent error reporting mode"
#    otherewise for it will throw error like t.sh: llegal option -- x
#    it is often we want to handle the error
# set -xv
while :; do
  while getopts ':hr' Option; do
    case "$Option" in
        # BAGA: t.sh -r day11 is different to t.sh day11 -r
        #   day11 is non-optional
        #   -r is optional
        #   The standard convention is to parse and stop at the non-optional arg
        #   workaround is to add additional while loop like this see https://stackoverflow.com/questions/34536116/how-to-ignore-invalid-arguments-with-getopts-and-continue-parsing
        r ) # actually create the folders
          echo "!!!!!!!!!!!"
          FLAG_DRY=0
          ;;
        # The expectation is t.py -h day11 will print out the usage, ignores day11
        h ) # show help
          usage 
          ;;
        # BAGA: If you put * as the first option, it will match everything even the valid ones
        * )
          echo "Argument missing Passed in an unknown options '$*'"
          usage
          ;;
    esac
  done
  ((OPTIND++)) 
  [ $OPTIND -gt $# ] && break
done
# echo "OPTARG=$OPTARG"
# BAGA: you can still leave $ in side like shift $(($OPTIND-1))
# or $(( OPTIND -1 ))
shift $((OPTIND-1)) 
foldername="$1"

echo "DEBUG: Positional arg1=$1"
echo "DEBUG: Positional arg2=$2"
echo "DEBUG: Total args=$#"

# TODO: This is repeating, can we don't have to print & run repeating?
if [[ $FLAG_DRY -eq 1 ]]; then
  echo "DRY_RUN ==>"
  echo
  (
  echo "cd $WORKING_DIR"
  echo "mkdir ${foldername}"
  echo "touch ${foldername}/${foldername}_input_complete"
  echo "touch ${foldername}/${foldername}_input_part1"
  echo "touch ${foldername}/${foldername}_input_part2"
  echo "touch ${foldername}/${foldername}_part1_solution_rev01.py"
  echo "touch ${foldername}/${foldername}_part2_solution_rev01.py"
  )
else
  echo "ACTUAL RUN !!! ==>"
  (
  cd $WORKING_DIR
  mkdir ${foldername}
  touch ${foldername}/${foldername}_input_complete
  touch ${foldername}/${foldername}_input_part1
  touch ${foldername}/${foldername}_input_part2
  touch ${foldername}/${foldername}_part1_solution_rev01.py
  touch ${foldername}/${foldername}_part2_solution_rev01.py
  )
fi

exit $?

