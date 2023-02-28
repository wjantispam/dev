#!/usr/bin/env bash
# PURPOSE:
#		Some good use of brace expansion 

# Echoes characters between a and z.
echo {a..z} # a b c d e f g h i j k l m n o p q r s t u v w x y z

# Echoes characters between 0 and 3.
echo {0..3} # 0 1 2 3

# Initializing an array, using extended brace expansion.
base64_charset=( {A..Z} {a..z} {0..9} + / = )

a=123
{ a=321; }
echo "a = $a"   # a = 321   (value inside code block)


File=/etc/fstab

{
read line1
read line2
} < $File

echo "First line in $File is:"
echo "$line1"
echo
echo "Second line in $File is:"
echo "$line2"

# Illustrates using code block
#+ save the output of a code block to a file

SUCCESS=0
E_NOARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` rpm-file"
  exit $E_NOARGS
fi  

{ # Begin code block.
  echo
  echo "Checking dependency "
  sudo apt-get check "$1"
	echo
  if [ "$?" -eq $SUCCESS ]
  then
    echo "$1 can be installed."
  else
    echo "$1 cannot be installed."
  fi  
  echo              # End code block.
} > "$1.test"       # Redirects output of everything in block to file.

echo "Results of rpm test in file $1.test"

exit 0
