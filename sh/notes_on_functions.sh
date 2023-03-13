#!/usr/bin/env bash
# Some qurks about bash functions
# 1. a few ways to write a function
# fun() {
#    command
# }
# fun {
#    command
# }
# function fun() {
#    command
# }
function f1() {
  echo "called function f1"
  function f2() {
    echo "=> called function f2"
  }
}

f2  #  Gives an error message.
    #  Even a preceding "declare -f f2" wouldn't help.

echo    

f1  #  Does nothing, since calling "f1" does not automatically call "f2".
f2  #  Now, it's all right to call "f2",
    #+ since its definition has been made visible by calling "f1".

echo

## Below is something a good fun!
#
NO_EXIT=1   # Will enable function definition below.
[[ $NO_EXIT -eq 1 ]] && exit() { true; }     # Function definition in an "and-list".
# If $NO_EXIT is 1, declares "exit ()".
# This disables the "exit" builtin by aliasing it to "true".

# invoke the exit function will never exit the code!
exit
