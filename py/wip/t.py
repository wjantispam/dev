#!/usr/bin/env python3

# Creating a dictionary 
# method 1
a = dict(one=1, two = 2, three = 3)
# method 2
b = {'one':1, 'two': 2, 'three':3}
# method 3 
c = dict(zip(['one', 'two', 'three'], [1,2,3]))
# method 4
e = dict({'three':3, 'one':1, 'two': 2})
# method 5
f = dict({'one':1, 'three':3}, two = 2)

a == b == c == e == f
