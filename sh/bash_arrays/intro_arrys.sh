#!/usr/bin/env bash
# Bash 4 / ksh93

printf "%s\n" "
##############################################################################
Associative arrays exist in AWK as "associative arrays", in Perl as "hashes", 
in Python and C# as "dictionaries", and in Java as a "Map".
##############################################################################
"
set -v

typeset -A homedir    # Declare associative array
homedir=(             # Compound assignment
    [jim]=/home/jim
    [silvia]=/home/silvia
    [alex]=/home/alex
)

homedir[ormaaj]=/home/ormaaj # Ordinary assignment adds another single element

for user in "${!homedir[@]}"; do   # Enumerate all indices (user names)
    printf 'Home directory of user %s is: %q\n' "$user" "${homedir[$user]}"
done

echo "
----------------------------------------------------------------------------
| This is an example to show 
----------------------------------------------------------------------------
"

# Create a test file of 11MB
dd if=/dev/zero of=test.tmp bs=11 count=1

rsync -e 'ssh -q' test.tmp test2.tmp

echo "now we try to make some parameter"
options=" -e 'ssh -q' "
echo "the following will fail"
eval rsync "$options" test.tmp test2.tmp
echo "The following will fail >>"
#rsync "$options" test.tmp test2.tmp

ls -lrth test.tmp test2.tmp

echo "You can also use array"
options=(-e 'ssh -q')
rsync "${options[@]}" test.tmp test3.tmp

echo "Other ways to make use of array"
# Ref: https://github.com/ShulaSharuba/NC-DC-Public/blob/b7d257fed523eebbfbfc2ea9915e60512054ee52/backup/legacy/rsync-backup
# Prepare ssh parameters for socket connection, reused by following sessions
sshParams=(-o "ControlPath=\"${ownFolderPath}/ssh_connection_socket_%h_%p_%r\"" -o "ControlMaster=auto" \
	-o "ControlPersist=10")

# Prepare rsync transport shell with ssh parameters (escape for proper space handling)
rsyncShellParams=(-e "ssh$(for i in "${sshParams[@]}"; do echo -n " '${i}'"; done)")

ls -lrth *.tmp

rm *.tmp
