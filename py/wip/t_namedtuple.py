#!/usr/bin/env python3

from collections import namedtuple
EmployeeRecord = namedtuple('EmployeeRecord', 'name, age, title, department, paygrade') 

Point = namedtuple('Point', ['x', 'y'])

t = [11, 12]
p = Point._make(t)

# now you can do 
print(p.x)
print(p.y)


p._asdict()

print(p)
