from typing import Type
# This appeared in 
# https://github.com/anthonywritescode/explains/tree/main/sample_code/ep096
# about type annotation and the difference between: X and Type[X]
class C:
    pass

class D(C):
    pass

def f1(c: C) -> None:
    ...

def f2(c: Type[C]) -> None:
    ...

f1(C())
f1(C)
f1(2)
f1(2)
