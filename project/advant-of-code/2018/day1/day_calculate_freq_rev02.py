#!/usr/bin/env python3
"""
Rev01: Basic structure
Rev02:
    Add
"""
import pytest
import argparse
from itertools import cycle
from typing import List

def part1(lines: List) -> int:
    freq = 0
    for num in lines:
        freq += int(num)

    return freq

# TODO: Function with declared type of "int" must return value on all code paths    Type "None"
def part2(lines: List) -> int:
    freq = 0
    seen = {0} # Better than seen = set(), seen.add(freq). BAGA: You can't do set(freq)
    for num in cycle(lines):
        freq += int(num)
        # print(f"{int(num)} ==> {freq}")
        if freq not in seen:
            seen.add(freq)
        
        # print(f"FOUND > {int(num)} ==> {freq}") 
        return freq

# THINK: How to present the input file? Ans: see t.py
# TODO: the input_s is 'List' in the original func but here is a 'str', can we make it the same?
@pytest.mark.parametrize(
        ('input_s', 'expected'),
        (
            ('+1\n-2\n+3\n+1', 3),
            ('+1\n+1\n+1', 3),
            ('+1\n+1\n-2', 0),
            ('-1\n-2\n-3', -6),
        ),
)
def test_part1(input_s, expected: int) -> None:
    # with open(input_s, 'r') as f:
    #     lines = f.readlines()
    lines = input_s.splitlines()  # TODO: We didn't use splitlines in the actual function
                                  #        How to replicate?
    assert part1(lines) == expected


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        ('+1\n-1', 0),
        ('+3\n+3\n+4\n-2\n-4', 10),
        ('-6\n+3\n+8\n+5\n-6', 5),
        ('+7\n+7\n-2\n-7\n-4', 14),
        # 0 -> 1 -> -1 -> 0
        ('+1\n-2', 0),
    ),
)
def test_part2(input_s, expected: int) -> None:
    lines = input_s.splitlines()
    assert part2(lines) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file, 'r') as f:
        # TODO: Saving them all in memory, good, bad?
        lines = f.readlines()
        print(f" Part1 ".center(80,'='))
        print(part1(lines))
        print(f" Part2 ".center(80,'='))
        print(part2(lines))
    return 0

if __name__ == '__main__':
    exit(main())
