#!/usr/bin/env python3
import sys

with open(sys.argv[1], 'r') as f:
    lines = f.readlines()

letters = [line.strip('\n') for line in lines]
# print(letters)
# using set to sort them into the group with the same length?

# TODO: is there a dictionary comprehension?
# x = [collection[len(set(letter))]=letter for letter in letters] 
# x = [uniq for uniq in set(letter) for letter in letters] 
# ['abcde', 'fghij', 'klmno', 'pqrst', 'fguij', 'axcye', 'wvxyz']

def is_diff_by_one_char(cmp_from_letter = 'fghij', cmp_to_letter = 'fguij'):
    if len(cmp_from_letter) != len(cmp_to_letter):
        return False
    count_diff_char = 0
    for i in range(len(cmp_from_letter)):
        print(f"+++> pos {i}\n{cmp_from_letter}\n{cmp_to_letter}")
        if cmp_from_letter[i] != cmp_to_letter[i]:
            print(f">>>> {cmp_from_letter[i] } ")
            count_diff_char += 1
        # We don't need to check all chars
        if count_diff_char > 1:
            print(f"......... NEXT....")
            return False
    return True
cmp_to_letter = 'abcde'
cmp_from_letter = 'fghij'
# print(is_diff_by_one_char(cmp_to_letter, cmp_from_letter))


def slow():
    for idx in range(len(letters)):
        cmp_from_letter = letters[idx]
        next_idx = idx+1
        while next_idx < len(letters):
            cmp_to_letter = letters[next_idx]
            if is_diff_by_one_char(cmp_from_letter, cmp_to_letter):
                print(f"ANS={cmp_from_letter} | {cmp_to_letter}")
                return next_idx
            next_idx += 1

def main():
    idx = slow()
    # ANS=revtaubfniyhusgxdoajwkqilp | revtaubfniyhpsgxdoajwkqilp
    return idx

def main_not_working():
    for idx in range(len(letters)):
        cmp_from_letter = letters[idx]
        next_idx = idx + 1
        # print(f"{idx}:{letters[idx]}".center(80,'.'))
        while next_idx < len(letters):
            # print(f"checking {letters[next_idx]")
            cmp_to_letter = letters[next_idx]
            cmp_diff = set(cmp_from_letter).difference(set(cmp_to_letter))
            # Identify the letters just differ by 1 char
            if len(cmp_diff) == 1:
                # still need to check if the letters are in order
                # set('fghij') is the same as set('jihgf')
                # print(f"+++>\n{cmp_from_letter}\n{cmp_to_letter}")
                if is_diff_by_one_char(cmp_to_letter, cmp_from_letter):
                    print(f"ANS={cmp_to_letter} | {cmp_from_letter}")
                # break
            next_idx += 1

if __name__ == '__main__':
    exit(main())

