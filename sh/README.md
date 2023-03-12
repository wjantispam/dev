## Subshell ideas
Ref: http://www.faqs.org/docs/abs/HTML/subshells.html
A subshell may be used to set up a "dedicated environment" for a command group.

``` bash
   1 COMMAND1
   2 COMMAND2
   3 COMMAND3
   4 (
   5   IFS=:
   6   PATH=/bin
   7   unset TERMINFO
   8   set -C
   9   shift 5
  10   COMMAND4
  11   COMMAND5
  12   exit 3 # Only exits the subshell.
  13 )
  14 # The parent shell has not been affected, and the environment is preserved.
  15 COMMAND6
  16 COMMAND7
```
One application of this is testing whether a variable is defined.
``` bash
   1 if (set -u; : $variable) 2> /dev/null
   2 then
   3   echo "Variable is set."
   4 fi
   5 
   6 # Could also be written [[ ${variable-x} != x || ${variable-y} != y ]]
   7 # or                    [[ ${variable-x} != x$variable ]]
   8 # or                    [[ ${variable+x} = x ]])
```
Another application is checking for a lock file:
```bash
   1 if (set -C; : > lock_file) 2> /dev/null
   2 then
   3   echo "Another user is already running that script."
   4   exit 65
   5 fi   
```
Processes may execute in parallel within different subshells. This permits breaking a complex task into subcomponents processed concurrently.
