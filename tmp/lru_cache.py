#!/usr/bin/env python3
"""
https://devdocs.io/python~3.11/library/functools
Two common examples of using cache
"""
from functools import cache
from functools import lru_cache


@cache
def factorial(n):
    # if n:
    #     return n * factorial(n-1) 
    # else:
    #     return 1
    return n * factorial(n-1) if n else 1

factorial(10)
print(factorial(12))


@lru_cache(maxsize=None)
def fib(n):
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)

x = [fib(n) for n in range(16)]
print(x)
print(fib.cache_info())
