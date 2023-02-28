#!/usr/bin/env python3
"""
Construct car and cdr function to achieve: 
car(cons(a,b)) return minimal
cdr(cons(a,b)) return maximal 
"""
def cons(a,b):
    return lambda f: f(a,b)

c = cons(3,4)
d = c(min)
print(d)

# TODO: How to pass on "min" to "f"
def car(f):
    f = min
    return f

print(car(cons(4,5)))

