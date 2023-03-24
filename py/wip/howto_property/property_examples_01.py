"""
property() is a builtin function

class property(fget=None, fset=None, fdel=None, doc=None)
Return a property attribute.

To understand property() it needs to understand what's a "descriptor".
https://docs.python.org/3/howto/descriptor.html?highlight=property

Descriptors are the mechanism behind properties, methods, etc.
It simplify the underlying C-code
"""

# class Ten:
#     def __get__(self, obj, objtype = None):
#         reutrn 10

# class A:
#     x = 5
#     y = Ten()

# a = A()
# print(a.x)

class RevealAccess(object):
    def __init__(self, initval = None, name = 'var'):
        self.val = initval
        self.name = name
 
    def __get__(self, obj, objtype):
        print('Retrieving', self.name)
        return self.val
    
    def __set__(self, obj, val):
        print('Updating', self.name)
        self.val = val

class MyClass(object):
    x = RevealAccess(10, 'var "x"')
    y = 5
    
    
m = MyClass()       # Retrieving var "x"
print(m.x)          # 10
m.x = 20            # Updating var "x"
print(m.y)          # 5


print(" Static methods ".center(80, '.'))
class E(object):
    def f(x):
        print(x)
    f = staticmethod(f)
print(E.f(3))    
print(E().f(3))

print(" vs non-static methods ".center(80, '.'))
class E2(object):
    def f(x):
        print(x)

print(E2.f(3))
# The following will produce an error
# TypeError: f() takes 1 positional argument but 2 were given
# print(E2().f(3))


print(" Class methods ".center(80, '.'))
class E(object):
    def f(klass, x):
        return klass.__name__, x
    f = classmethod(f)
    
print(E.f(3))

print(E().f(3))

print(" Example of class methods ".center(80, '.'))
class Dict2(object):
   def fromkeys(klass, iterable, value = None):
       d = klass()
       for key in iterable:
           d[key] = value
        return d
    fromkeys = classmethod(fromkeys)
    
Dict2.fromkeys('abracadabra')