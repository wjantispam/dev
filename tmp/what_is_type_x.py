from typing import Type

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
