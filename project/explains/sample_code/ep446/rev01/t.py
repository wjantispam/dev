import os

os.system('rm -rf astpretty')
os.system('git clone -qq https://github.com/asottile/astpretty')
os.system('cd astpretty')
print('before git status!')
os.system('git status')
