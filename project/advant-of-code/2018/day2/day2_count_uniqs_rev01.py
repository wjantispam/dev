#!/usr/bin/env python3
"""
Rev01:
    Part1: Get letters appeared exactly two and three times
        pytest: ⟩ python3 -m pytest -q day2_count_uniqs_rev01.py
            II    III
    abcdef   0     0    no two's and three's
    bababc   1     1
    abbcde   1     0
    abcccd   0     1
    abbcdd   1     0    it has two two's but only count once
    abcdee   1     0
    ababab   0     1    it has two three's but only count once
TOTAL        4     3
ANS = 4 x 3 = 12
"""
from collections import Counter
import argparse
import pytest


# TODO: we decouple the reading input from the actual function
def part1(input_s: str) -> int:
    # print(input_s)
    # input_s looks like ['abcdef\n', 'bababc\n', 'abbcde\n', 'abcccd\n', 'aabcdd\n', 'abcdee\n', 'ababab\n']
    total_number_of_two_items = total_number_of_three_items = 0
    for line in input_s:
        line = line.strip('\n')
        number_of_two_items = number_of_three_items = 0
        for _, count in Counter(line).items():
            # print(f" loop {letter} {count} ".center(80, '.'))
            if count == 2:
                number_of_two_items = 1
                # print(f"{line}==>{letter}:2")
            elif count == 3:
                number_of_three_items = 1
                # print(f"{line}==>{letter}:3")
        total_number_of_two_items += number_of_two_items
        total_number_of_three_items += number_of_three_items
    #     print(f"line {line} two's = {number_of_two_items}, three's = {number_of_three_items}")
    # print(f"Total two's = {total_number_of_two_items}, three's = {total_number_of_three_items}")

    return total_number_of_two_items*total_number_of_three_items


# THINK: How to present the input file? Ans: see t.py
# TODO: the input_s is 'List' in the original func but here is a 'str', can we make it the same?
@pytest.mark.parametrize(
        ('input_s', 'expected'),
        (
            # ('aaaaee\nbbbbbb\n', 0), # TODO: is bbbbbb zero three's as it is NOT ONLY appeared three times?
            # ('aaaabb\naaaccc\n', 2), # TODO: aaaa didn't appear twice ONLY 
            ('abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab\n', 12),
        ),
)
def test_part1(input_s: str, expected: int) -> None:
    input_s.rsplit('\n')
    # with open(input_s, 'r') as f:
    #     lines = f.readlines()
    lines = input_s.splitlines()  # TODO: We didn't use splitlines in the actual function
                                  #        How to replicate?
    assert part1(lines) == expected



def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    
    with open(args.data_file, 'r') as lines:
        input_s = lines.readlines()
    print(".............")
    print(input_s)
    print(f" Part1 ".center(80,'='))
    ans = part1(input_s) 
    print(f"Total = {ans}")
    return 0

if __name__ == '__main__':
    exit(main())
