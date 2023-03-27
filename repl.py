


def example(a, b, **kw):
    return a*b


type(example)
# OUT: <class 'function'>

example.__code__.co_varnames
# OUT: ('a', 'b', 'kw')
example.__code__.co_argcount
# OUT: 2
mersenne = lambda x: 2**x-1
mersenne(10)
# OUT: 1023
# Higher-order function
# Function that can accept a function as an argument or return a function as a value
# eg max()
year_cheese = [(2000,29.87), (2001, 30.12), (2002, 30.6), (2003,
30.66),(2004, 31.33), (2005, 32.62), (2006, 32.73), (2007, 33.5),
(2008, 32.84), (2009, 33.02), (2010, 32.92)]
max(year_cheese)
# OUT: (2010, 32.92)

# now using the function as an arg for max()
max(year_cheese, key = lambda x: x[1])
# OUT: (2007, 33.5)
max(map(lambda yc: (yc[1], yc), year_cheese)
)
# OUT: (33.5, (2007, 33.5))
_[1]
# OUT: (2007, 33.5)
max(map(lambda yc: yc[1], year_cheese))
# OUT: 33.5
# above known as the wrap-process-unwrap patter
# unwrap(process(wrap(structure)))

# We can also have special functions with names like fst() and snd() that we can use a
# function prefix instead of a syntactic suffix of [0] and [1]
snd = lambda x: x[1]
snd(max(map(lambda yc: (yc[1], yc), year_cheese)))
# OUT: (2007, 33.5)
### 