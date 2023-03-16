#!/usr/bin/env bash
# Create a folder for the new day and add some boilderplates files
# Examples
# script day2 -- creates a folder with files called day2
# script -d day2 -- dryrun but not actually creates it
# script -h -d   -- this seems wrong to both print help and do dry-run
day_x=$1

NO_ARGS=0
E_OPTERROR=85

function usage(){
  # echo "Usage `basename $0` <foldername> [-d | -h])"
  echo "Usage $(basename $0)" && grep ") #" $0 | grep -v "grep"
  exit 0
}

# if [[ $# -eq "$NO_ARGS" ]]; then
#   usage
# fi
# see man bash, and https://wiki.bash-hackers.org/howto/getopts_tutorial
# getopts OPTSTRING VARNAME [ARGS...]
# getopts fAx VARNAME for it to look for -f -A -x, so you can do
#    t.sh -f or t.sh -A or t.sh -fAx or t.sh -Axf etc.
# getopts fA:x VARNAME the : after A means it expected an argument
#    t.sh -f -A SOMETHING
# getopts :fA:x VARNAME the first : is to switches to "silent error reporting mode"
#    otherewise for it will throw error like t.sh: llegal option -- x
#    it is often we want to handle the error
while getopts ':hd' Option; do
  case "$Option" in
  set -x
      d ) # dary-run
        echo "Running in dry-run mode" 
        ;;
      : )
        echo "Argument missing"
        usage
        ;;
      # BAGA: If you put * as the first option, it will match everything even the valid ones
      h ) # show help
        usage 
        ;;
      * )
        echo "Argument missing Passed in an unknown options '$*'"
        usage
        ;;
  esac
done

# echo "OPTARG=$OPTARG"
# shift $(($OPTIND-1))
exit $?

