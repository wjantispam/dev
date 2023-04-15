#!/usr/bin/env bash
# docstore.mik.ua/orelly/unix/upt/ch34_03.htm
# The shell script checksed automates the process of checking the edits that sed makes. 
#   It expects to find the script file, sedscr
#   in the current directory and applies these instructions to the input files named on the command line. 
#   The output is shown by a pager program
# Eg: bash checksed.sh test_sed_old_error.log new.log
script=sedscr 
for file do 
	echo "********** < = $file > = sed output **********" 
	sed -f $script "$file" | diff "$file" -
done | ${PAGER-less}

