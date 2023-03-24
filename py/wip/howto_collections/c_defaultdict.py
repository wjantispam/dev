from collections import defaultdict
from pprint import pprint
s = [('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]

d = defaultdict(list)

for k, v in s:
    d[k].append(v)

pprint(d)

# Alternatively, this can be done with the setdefault method (but slower)
d = {}
for k, v in s:
    d.setdefault(k, []).append(v)
pprint(d)


def constant_factory(value):
    return lambda: value

d = defaultdict(constant_factory('<missing>'))

d.update(name = 'John', action = 'ran')

# '%(name)s %(action)s to %(object)s' % d
# https://docs.python.org/3/library/stdtypes.html#old-string-formatting
print('%(name)s %(action)s to %(object)s' % d)