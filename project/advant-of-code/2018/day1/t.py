#!/usr/bin/env python4
# EXPERIMENT:
#   how to simulate reading from a inputfile
#   how to print the raw format inc /n etc. (Ans: Use print(repr(raw))
 # ⟩ python3 t.py day1_input
 #   '+7\n+7\n-2\n-7\n-4\n'


import sys
with open(sys.argv[1]) as f:
    read_data = f.read()
    # The input type is 'str'
    print(f"Input type is {type(read_data)}")
    # output looks like '+7\n+7\n-2\n-7\n-4\n'
    print(repr(read_data))
