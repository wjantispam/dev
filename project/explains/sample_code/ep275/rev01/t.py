from __future__ import annotations


class C:
    def __init__(self, x: int) -> None:
        self.x = x

    def __eq__(self, other: C) -> bool:
        return self.x == other.x

    def __repr__(self) -> str:
        return f'{type(self).__name__}({self.x})'
