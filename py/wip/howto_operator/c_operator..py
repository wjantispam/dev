

# Equivalent to operator.attrgetter
def attrgetter(*items):
    if any(not isinstance(item, str) for item in items):
        raise TypeError('attribute name must be a string')
    if len(items) == 1:
        attr = items[0]
        def g(obj):
            return resolve_attr(obj, attr)
    else:
        def g(obj):
            return tuple(resolve_attr(obj, attr) for attr in items)
    return g

def resolve_attr(obj, attr):
    for name in attr.split("."):
        obj = getattr(obj, name)
    return obj

# operator.itemgetter(*items)
#  Equivalent to:
def itemgetter(*items):
    if len(items) == 1:
        item = items[0]
        def g(obj):
            return obj[item]
    else:
        def g(obj):
            return tuple(obj[item] for item in items)
    return g

# Examples of using itemgetter
print("Using itemgetter".center(80,'.'))
print(itemgetter(1)('ABCDEFG'))
print(itemgetter(1, 3, 5)('ABCDEFG'))
print(itemgetter(slice(2,None))('ABCDEFG'))

soldier = dict(rank='captain', name='dotterbart')
print(itemgetter('rank')(soldier))

# Examples of using attrgetter
class Student:
    def __init__(self, name, grade, age):
        self.name = name
        self.grade = grade
        self.age = age
    def __repr__(self):
        return repr([self.name, self.grade, self.age])
    
student_objects = [
    Student('john', 'A', 15),
    Student('jane', 'B', 12),
    Student('dave', 'B', 10),
]


student_tuples = [
    ('john', 'A', 15),
    ('jane', 'B', 12),
    ('dave', 'B', 10),
]

print("Using attrgetter".center(80,'.'))
print(sorted(student_objects, key=attrgetter('age')))
print(sorted(student_tuples, key=lambda student: student[2]))   # sort by age


# itemgetter needs tuples
#  It needs tuples
print("More attrgetter".center(80,'.'))
print(sorted(student_tuples, key=itemgetter(2)))


# The operator module functions allow multiple levels of sorting. 
#   For example, to sort by grade then by age:
print("Sort by grade then age".center(80, '-'))
print(sorted(student_tuples, key=itemgetter(1,2)))
print(sorted(student_objects, key=attrgetter('grade', 'age')))
