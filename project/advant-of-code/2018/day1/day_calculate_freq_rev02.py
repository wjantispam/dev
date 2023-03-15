#!/usr/bin/env python3

with open('day1_input_complete', 'r') as f:
# with open('day1_input', 'r') as f:
    lines = f.readlines()

def part1():
    freq = 0
    for num in lines:
        freq += int(num)

    return freq

def part2():
    from itertools import cycle
    from time import sleep

    freq = 0
    seen = set()
    for num in cycle(lines):
        freq += int(num)
        if freq in seen:
            print(f"FOUND > {int(num)} ==> {freq}")
            return freq
        else:
            seen.add(freq)
        print(f"{int(num)} ==> {freq}")

print(part1())
print(part2())



