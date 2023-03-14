README for Python

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

