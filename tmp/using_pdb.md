## Enable pdb

import pdb; pdb.set_trace()

import pdb
pdb.set_trace()

__import('pdb').set_trace()

# python 3.7+
breakpoint()

## Basic commands
help
continue
q  # quit

list
list .
ll  # longlist

where
up
down

locals()
globals()

ENVIRONMENT_DIR  # variable name
p ENVIRONMENT_DIR  # print

pp ret  # pretty print
p ret

n  # next
p exe
c  # continue
s  # step
p sys.executable
return
