#!/usr/bin/env python3
try:
    raise Exception('spam', 'eggs')
except Exception as inst:
    print(type(inst))
    print(inst.args)
    print(inst)

    x, y = inst.args
    print("x=", x)
    print("y=", y)

import sys
try:
    f=open('file.txt')
    s = f.readline()
    i = int(s.strip())
except OSError as err:
    print(f"os error: {err}")
except ValueError:
    print(f"could not convert to int")
except Exception as err:
    print(f"unexpected error {err=}, type {type(err)=}")
    raise
