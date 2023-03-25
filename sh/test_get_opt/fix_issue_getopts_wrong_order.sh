#!/usr/bin/env bash
# How to ignore invalid arguments with getopts and continue parsing?
# Below script is to show a remove of a file
#  t.sh -f file     # this works and deletes the files
#  t.sh file -f     # this will do nothing
#  t.sh -fab file   # still deleted the file even wrong args passed
#
# https://stackoverflow.com/questions/34536116/how-to-ignore-invalid-arguments-with-getopts-and-continue-parsing
# The workaround is to add extra while loop to check the numer of optind
while :; do
  while getopts :f arg; do
    case $arg in
      f)
        echo "Remove the file"
        echo Option $arg specified.
        ;;
      *)
        echo Unknown option: $OPTARG.
        ;;
    esac
  done
  ((OPTIND++)) 
  [ $OPTIND -gt $# ] && break
done

######### WORKAROUND ################
# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./fix_issue_getopts_wrong_order.sh -f adsf
# Remove the file
# Option f specified.

# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./fix_issue_getopts_wrong_order.sh sadf -f
# Remove the file
# Option f specified.

# TODO: This should be stopped
# FAIL ! This still not expected
# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./fix_issue_getopts_wrong_order.sh -fsadf adsf
# Remove the file
# Option f specified.
# Unknown option: s.
# Unknown option: a.
# Unknown option: d.
# Remove the file
# Option f specified.

############ ISSUES ################
# # OH this works
# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./issue_getopts_wrong_order.sh -f adsf
# Remove the file
# Option f specified.


# FAIL
# # OH NO, this didn't do anything
# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./issue_getopts_wrong_order.sh sadf -f

# FAIL
# # OH NO, you deleted the file
# ~/main/dev/sh/test_get_opt · (main±)
# ⟩ ./issue_getopts_wrong_order.sh -fasdf adsf
# Remove the file
# Option f specified.
# Unknown option: a.
# Unknown option: s.
# Unknown option: d.
# Remove the file
# Option f specified.

