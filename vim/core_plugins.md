

## Plugin: toggleterm.nvim 
Most useful to run python from vim. In LunarVim the shortcut is Alt+1|2|3

use :TermExec cmd="python %” to run the Python file
use :TermExec cmd=”python -m pdb %” to debug the Python file.
# This seems not working
use :TermExec cmd="nodemon -e py %” to monitor the Python file.
# Linux
use :TermExec cmd="nodemon --exec python3 %” to monitor the Python file.


The last command requires nodemon that can be installed via npm.
