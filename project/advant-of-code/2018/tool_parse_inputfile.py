#!/usr/bin/env python3
# EXPERIMENT:
#   how to simulate reading from a inputfile
#   how to print the raw format inc /n etc. (Ans: Use print(repr(raw))
 # ⟩ python3 t.py day1_input
 #   '+7\n+7\n-2\n-7\n-4\n'


from os import killpg
import sys
import fileinput

with open(sys.argv[1]) as f:
    read_data = f.read()
    # The input type is 'str'
    print(f"Input type is {type(read_data)}")
    # output looks like '+7\n+7\n-2\n-7\n-4\n'
    print(repr(read_data))


# TODO: this still not printing translate stdin from a file to 'abcdef\nbababc\nabbcde'
def convert_infile_to_str(inputfilename) -> str:
    lines = list(fileinput.input(inputfilename)) 
    return "".join(lines)

print("...........................")
data = convert_infile_to_str(sys.argv[1])
print(data)


# BAGA: Not working
# this returned 'abcdef\n''bababc\n''abbcde\n''abcccd\n''aabcdd\n''abcdee\n''ababab\n'
def convert_infile_to_str2(inputfile):
    data = ""
    with open(inputfile) as lines:
        for line in lines:
            data += repr(line)
            print(f".. {repr(line)}")
    return data
print("convert_infile_to_str2".center(80,'.'))
data = convert_infile_to_str2(sys.argv[1])
print(data)


def convert_infile_to_str3(inputfile):
    with open(inputfile) as f:
        data = str(f)
    return data

print("convert_infile_to_str3".center(80,'.'))
data = convert_infile_to_str3(sys.argv[1])
print(data)
    
