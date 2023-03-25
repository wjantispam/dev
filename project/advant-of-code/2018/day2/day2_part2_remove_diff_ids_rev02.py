#!/usr/bin/env python3
import sys
import fileinput


# str.strip() removes the '\n' so you don't need to specify it
letters = [line.strip() for line in fileinput.input()]

def fast():
    for cmp_from_letter in letters:
        for cmp_to_letter in letters:
            ans = "".join(a for a, b in zip(cmp_from_letter, cmp_to_letter) if a == b)

            if len(ans) == len(cmp_from_letter)-1:
                return ans


def main():
    return fast()

if __name__ == '__main__':
    exit(main())

