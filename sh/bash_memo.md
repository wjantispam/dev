Safe ways to do things in bash
==============================

Thanks to @Anordal/shellharden I'm learning how to use bash safely. This means two things
1. More portable, for example, if you start bash with `#!/bin/bash` then you may run into issues on a different platform that didn't have bash on the hard coded path. However, it is safter to use `#!/usr/bin/env bash` where it will work when you move a different platform.
2. Produceable, eg. `echo $10` vs `echo "$10"` vs `echo ${10}` which one will give you consident result? 

Examples
--------

Creating directory: use `mkdir -p mydir` with `-p` flag so it won't error if the dirctory exists.

Creating symbloic link: to be safe always use `ln -snf real_path new_name`. `-f` to remove existing symlink file and `-n` to make sure it won't create a symbloic link insde the directory.
```sh
    $ mkdir a
    $ ln -sf a b
    $ ln -sf a b
    # you created a extra sym link inside the folder!
    $> tree
    .
    ├── a
    │   └── a -> a
    └── b -> a
```

Removing a file: using `rm -f example.txt` so it is fine even when the example.txt doesn't exist.

Reference the script: It is safter with `${BASH_SOURCE:-$0}`, to find out the difference btween BASH_SOURCE and `$0` see here https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source

Creating an empty file: touch example.txt

files=((1024)
    a
    b
)
duplicates=()
for f in "${files[@]}"; do
    if cmp -- "$f" other/"$f"; then
        duplicates+=("$f")
    fi
done
if [ "${#duplicates[@]}" -gt 0 ]; then
    rm -- "${duplicates[@]}"
fi
