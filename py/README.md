README for Python

# Workflow
Instead of using tmux or screen it is actually quicker to have two terminal windows
one terminal to edit the code
another one to keep track of it, like a REPL using `nodemon --exec python3 t.py`

## Tools that I often use
1. bpython/btpython/ipython
1. LunarVim
1. VSCode


# Manage multiple environments
## Install the new python version

```sh
$ sudo apt update
# Install Dependencies
$ sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
# Running `sudo apt install python3 -y` will not install the latest
# Download the package from python.org then compile it
$ wget https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz
$ tar -xvf Python-3.11.1.tgz
$ cd Python-3.11.1
$ sudo ./configure --enable-optimizations
# The following are recommended from the installation readme file
$ make
$ make test
$ sudo make install
$ python3.11 -V # verify
```
Other people suggested to use pyenv but I haven't tried it yet (https://blog.lazkani.io/posts/a-python-environment-setup/)

## Activate the python environment

### VirtualFish

```sh
vf new env11
# Upgrade the current virtualenv to use the latest python
vf upgrade --rebuild --python /usr/local/bin/python3.11
```

### VScode
Python from the side bar -> Python Environments -> VirtualEnvWrapper -> click the thumb to activate



# IPython alternatives
## bpyton

`pip3 install bpython`
`pip3 install pyperclip`  -- enable the clipboard
F2 to show the source code of the function
F6 to reload the modules or packages
F5 enable auto-reload
F10 using pyperclip to copy it
Ctrl+r to undo one or just the last few liens
Ctrl+x edit code in an external editor
Ctrl+s save the file

Ref: https://realpython.com/bpython-alternative-python-repl/

`pip3 install btpython`

# Using Python in the fish shell
### Fish virtual env
You can install the virtualenv via
```
pip3 install virtualenv
virtualenv venv
source ./bin/activate.fish    / enable the fish specifics
```

I'm currently using `virtualfish`
See: https://virtualfish.readthedocs.io/en/latest/install.html

```
# Install virtualfish
python -m pip install --user virtualfish.
# or 
vf install
```

### Customizing Your fish_prompt
Customizing Your fish_prompt
```
funced fish_prompt -e vim
# add virtual environment name to prompt
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

```

Then, type `funcsave fish_prompt` to save

