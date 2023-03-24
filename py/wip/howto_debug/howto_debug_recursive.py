#!/usr/bin/env python3
# How can I debug a recursive function
# Method 1
# Method 2 use a decorator to log function
# Illustrate recusive function using a factorial function (fact)

# fact(5)
# | 5  * fact(4)
# || 5 * (4 * fact(3))
# ||| 5 * (4 * (3 * fact(2))
# |||| 5 * (4 * (3 * (2 * fact(1))))
# ||||| 5 * (4 * (3 * (2 * (1 * fact(0)))))
# |||||| 5 * 4 * 3 * 2 * 1 * 1
# 120


import functools
repeat = 0  # you need to declare outside of function


def fib(n):
    global repeat  # you need to use 'global' keyword in order to modify global variable
    repeat += 1
    if n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)


fib(5)
print(repeat)
# call tree looks like this:
#                  fib(5)
#          fib(4)    +    fib(3)
#    fib(3) + fib(2)    fib(2) + fib(1)
# fib(2)+fib(1)

# Method 2:
# https://stackoverflow.com/questions/58267788/debugging-recursive-function-to-se-how-many-times-it-repeats-a-certain-calculati


def log_calls(func):
    @functools.wraps(func)
    def logged(*args):
        print(f'call {func.__name__}({", ".join(map(repr, args))})')
        return func(*args)

    return logged


@log_calls
def fib2(n):
    return 1 if n < 3 else fib2(n - 1) + fib2(n - 2)


print("........... Using @log_calls")
fib2(5)
# This will output the following
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)


@log_calls
def fact(n):
    return 1 if n == 0 else n * fact(n - 1)


print(fact(10))

print("Using lru_cache ....")
print("Did it the memoize works?")

@functools.lru_cache
@log_calls
def factorial(n):
    return n * factorial(n - 1) if n else 1


factorial(10)
# TODO: What does CacheInfo output mean?
# CacheInfo(hits=0, misses=11, maxsize=128, currsize=11)
print(factorial.cache_info())


@functools.lru_cache(maxsize=None)
def fib_cache(n):
    if n < 2:
        return n
    return fib_cache(n-1) + fib_cache(n-2)

# fib_cache(5)
# # CacheInfo(hits=3, misses=6, maxsize=None, currsize=6)
# print(fib_cache.cache_info())

fib_cache(10)
# CacheInfo(hits=8, misses=11, maxsize=None, currsize=11)
print(fib_cache.cache_info())


fib2(10)
# call fib2(10)
# call fib2(9)
# call fib2(8)
# call fib2(7)
# call fib2(6)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(6)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(7)
# call fib2(6)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(8)
# call fib2(7)
# call fib2(6)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(6)
# call fib2(5)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(4)
# call fib2(3)
# call fib2(2)
# call fib2(1)
# call fib2(2)