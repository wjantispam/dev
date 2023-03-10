# How to apply patch

In the below YouTube author apparently lost his changes when using stash.
Below shows how to do this via 'git apply' and 'patch' commands
Ref: https://github.com/anthonywritescode/explains/tree/main/sample_code/ep099

babi setup.cfg
git diff
git diff > backwards.patch
cat backwards.patch
git status

git checkout -- .
git status
babi setup.cfg

git apply backwards.patch
git status

git checkout -- .
git status

patch --help
patch -p1 -i backwards.patch
git diff
