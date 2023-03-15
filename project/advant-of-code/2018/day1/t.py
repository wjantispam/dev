#!/usr/bin/env python3
# EXPERIMENT:
#   how to simulate reading from a inputfile
#   how to print the raw format inc /n etc. (Ans: Use print(repr(raw))
 # ⟩ python3 t.py day1_input
 #   '+7\n+7\n-2\n-7\n-4\n'


import sys
with open(sys.argv[1]) as f:
    read_data = f.read()
    print(repr(read_data))
