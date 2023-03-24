def combinations(iterable, r):
    # combinations('ABCD', 2) --> AB AC AD BC BD CD
    # combinations(range(4), 3) --> 012 013 023 123
    pool = tuple(iterable)
    n = len(pool)
    if r > n:
        return
    indices = list(range(r))
    print("yield one")
    yield tuple(pool[i] for i in indices)
    print(f"{indices=}")
    while True:
        for i in reversed(range(r)):
            print("inside ....")
            if indices[i] != i + n - r:
                print("break...")
                break
        else:
            print("return ...")
            return
        indices[i] += 1
        print(f"new {indices=}")
        for j in range(i+1, r):
            indices[j] = indices[j-1] + 1
            print(f"final {indices=}")
        print("yield two")
        yield tuple(pool[i] for i in indices)

print(combinations(range(3), 2))

for i in combinations('ABCD', 2):
#for i in combinations(range(4), 3):
    print(i) 