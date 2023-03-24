from collections import namedtuple


# namedtuple(typename, field_names, *, rename=False, defaults=None, module=None) 
# The field_names are a sequence of strings
# such as ['x', 'y']. Alternatively, field_names can be a single string
# with each fieldname separated by whitespace and/or commas, for example
# 'x y' or 'x, y'.
Point = namedtuple('Point', ['x', 'y'])   # <class '__main__.Point'>
p = Point(11, y = 22)

# namedtuple can still use the usual indices
p[0] + p[1]

# it can also unpack like regular tuple
x, y = p

p.x + p.y

p  # Point(x=11, y=22)

# classmethod somenamedtuple._make(iterable)¶
t = [11, 12]
Point._make(t)   # Point(x=11, y=12)

# somenamedtuple._asdict()
p = Point(x = 11, y = 12)
p._asdict()      # {'x': 11, 'y': 12}

# somenamedtuple._replace(**kwargs)
p = Point(x=11, y=22)
p._replace(x=33)

# # OR 
# for partnum, record in inventory.items():
#     inventory[partnum] = record._replace(price=newprices[partnum], timestamp=time.now())

# somenamedtuple._fields
p._fields   # ('x', 'y')

Color = namedtuple('Color', 'red green blue')
Color._fields    # ('red', 'green', 'blue')
Color2 = namedtuple('Color', ['red', 'green', 'blue'])
Color2._fields   # ('red', 'green', 'blue')
Color3 = namedtuple('Color', ('red', 'green', 'blue'))
Color3._fields


Pixel = namedtuple('Pixel', Point._fields + Color._fields)
Pixel(11, 22, 128, 255, 0) # Pixel(x=11, y=22, red=128, green=255, blue=0)

# defaults can be None or an iterable of default values. Since fields
# with a default value must come after any fields without a default, the
# defaults are applied to the rightmost parameters. For example, if the
# fieldnames are ['x', 'y', 'z'] and the defaults are (1, 2), then x will
# be a required argument, y will default to 1, and z will default to 2.

Account = namedtuple('Account', ['type', 'balance'], defaults=[0])
Account._field_defaults # {'balance': 0}
Account('premium')      # Account(type='premium', balance=0)

# To retrieve a field whose name is stored in a string, use the getattr() function:
getattr(p, 'x')

# To convert a dictionary to a named tuple, use the double-star-operator
d = {'x': 11, 'y': 22}
Point(**d)



