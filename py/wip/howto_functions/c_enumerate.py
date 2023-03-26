# equivalent version of enumerate

def enumerate(sequence, start=0):
    n = start
    for elem in sequence:
        yield n, elem
        n += 1

seasons = ['Spring', 'Summer', 'Autumn', 'Winter']
print(list(enumerate(seasons)))

print(list(enumerate(seasons, start=10)))


# equivalent version of zip
def zip(*iterables):
    sentinel = object()
    iterators = [iter(it) for it in iterables]
    while iterators:
        result = []
        for it in iterators:
            elem = next(it, sentinel)
            if elem is sentinel:
                return
            result.append(elem)
        yield tuple(result)

x = 'ABCD'
y = 'xy'
z = zip(x, y)
print(list(z))