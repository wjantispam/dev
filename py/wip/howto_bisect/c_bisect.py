from bisect import bisect, bisect_left, insort
from collections import namedtuple
from operator import attrgetter
from pprint import pprint

# bisect.bisect_left(a, x, lo=0, hi=len(a), *, key=None)
#  Locate the insertion point for x in a to maintain sorted order.
#  If x is already present in a, the insertion point will be before (to the left of) 
#  any existing entries. The return value is suitable for use in list.insert()
def index(a, x):
    'Locate the leftmost value exactaly equal to x'
    i = bisect_left(a, x)
    if i != len(a) and a[i] == x:
        return i
    raise ValueError

def find_lt(a, x):
    'Find rightmost value less than x'
    i = bisect_left(a, x)
    if i:
        return a[i-1]
    raise ValueError

# bisect.bisect(a, x, lo=0, hi=len(a), *, key=None)
#  Similar to bisect_left(), but returns an insertion point which comes after
#  (to the right of) any existing entries of x in a.

# bisect.insort(a, x, lo=0, hi=len(a), *, key=None)
#  Inserting x in `a` after any existing entries of x

# Example:
## Use bisect() for numerical table lookup
def grade(score, breakpoint = [60,70,80,90], grades = 'FDCBA'):
    i = bisect(breakpoint, score)
    return grades[i]

mygrade = [grade(score) for score in [33,99,77,70,89,90,100]]
print(mygrade)     # ['F', 'A', 'C', 'C', 'B', 'A', 'A']


# Example:
Movie = namedtuple('Movie', ('name', 'released', 'director'))
movies = [
    Movie('Jaws', 1975, 'Speilberg'),
    Movie('Titanic', 1975, 'Cameron'),
    Movie('The Birds', 1963, 'Hitchcock'),
    Movie('Aliens', 1986, 'Scott'),
]

by_year = attrgetter('released')

## Find the first movie released after 1960
##   sort the movies by year - then this can be used in bisect
movies.sort(key=by_year)
print(movies)

##    use bisect to find the first movie released after 1960

print("Find movie using bisect".center(80, '.'))
print(movies[bisect(movies, 1960, key=by_year)]) # Movie(name='The Birds', released=1963, director='Hitchcock')
print(movies[bisect(movies, 1963, key=by_year)]) # Movie(name='Jaws', released=1975, director='Speilberg')

## Insert a movie while maintaining sort order
print("Inset new movie using insort".center(80, '.'))
romance = Movie('Love Story', 1970, 'Hiller')
insort(movies, romance, key=by_year)
pprint(movies)

# Example:
## If the key function is expensive, it is possible to avoid repeated function
##  call by searching a list of precomputed keys to find the index of a record
data = [
    ('red', 5), 
    ('blue', 1),
    ('yellow', 8),
    ('black', 0),
    ]
data.sort(key=lambda r: r[1])    # or use operator.itemgetter(1)
keys = [r[1] for r in data]
print("Find key using precomputed keys".center(80,'.'))
print(data[bisect_left(keys, 0)])   # ('black', 0)
print(data[bisect_left(keys, 1)])   # ('blue', 1)
print(data[bisect_left(keys, 5)])   # ('red', 5)
print(data[bisect_left(keys, 8)])   # ('yellow', 8)