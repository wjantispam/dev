#!/usr/bin/env bash
# We test and learn how to use double quotes
#   We also test how to use it with base name with simulation of weird file name and symlinks
#     we use tricks of symlink (odd names too) without duplication
## here is the folder structure
#$> tree -a
#.
#├── template_1.sh
#├── test_basename_\012with_a_new\012 _line_and space.sh                      # real file with extention
#├── --test_symlink.sh -> test_basename_\012with_a_new\012 _line_and space.sh # name with --
#├── .test_symlink.sh -> test_basename_\012with_a_new\012 _line_and space.sh  # name with .
#└── test_symlink.sh -> test_basename_\012with_a_new\012 _line_and space.sh   # symlink file

# shellcheck disable=SC2016 # I know when to use single quotes
echo
THIS_ARG="$0"
echo "If you don't double quote this you doomed to fail"
echo "with double quote it works =============="
echo "$THIS_ARG"
echo
echo
echo '================ GOOD "$(basename "$THIS_ARG")" ========================='
echo '================= BAD "$(basename $THIS_ARG)"   ========================='
echo '                                 ^         ^'
echo '                                 |         |'
echo '                                 ^---------^--- You still need double quotes here!'
INIT_SCRIPT_NAME="$(basename "$THIS_ARG")"
#INIT_SCRIPT_NAME="$(basename $THIS_ARG)"
echo "$INIT_SCRIPT_NAME"
echo
echo
echo "================ Test symlink - You need to run the symlinked file manually ========================="
echo '=============== GOOD: "$(basename "$(readlink -- "$THIS_ARG")")" ======================================'
[ -h "$THIS_ARG" ] && INIT_SCRIPT_NAME="$(basename "$(readlink -- "$THIS_ARG")")"  # in case of symlink, and -- to avoid filename contains --
echo '================ BAD: "$(basename $(readlink $THIS_ARG))" ======================================'
echo '                                 ^          ^         ^^'
echo '                                 |          |         ||'
echo '                                 ^----------^---------^^ You still need to put double quotes around them!' 
echo
echo '======= If you see a weired name with spaces and new line then you find the real file'
echo "$INIT_SCRIPT_NAME"
printf "%s\n" "$INIT_SCRIPT_NAME"
echo
echo '======= Test how to strip the extention'
INIT_SCRIPT_NAME_NOEXT=${INIT_SCRIPT_NAME%.*}     
echo "$INIT_SCRIPT_NAME_NOEXT"

exit 0