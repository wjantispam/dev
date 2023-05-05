#!/usr/bin/env python3
#
# TODO:
#  1. This doesn't handle some of the simple maths equations, see https://projecteuler.net/problem=9
#  1. It didn't handle the blockquote as in https://projecteuler.net/problem=12
#  1. I run 'fmt -u output.txt > euler-problems.txt' to make the width=70
#     the -u option is to make sure the tile "problem xx" not squashed with the contents

from urllib.request import urlopen
from urllib.error import HTTPError
from bs4 import BeautifulSoup

file = "output.txt"

# Create and trucate the file
try:
    open(file, "a").close()
except OSError:
    print("Failed creating the file")
else:
    print("File created")

for s in range(1, 588):
    # Grab web pages
    url = "https://projecteuler.net/problem=%03d" % s
    try:
        with urlopen(url) as s:
            page = s.read()
            soup = BeautifulSoup(page, features="html.parser")
            problem_info = soup.find("div", {"id": "problem_info"}).string
            problem_content = soup.find("div", {"class": "problem_content"}).text
            with open(file, "a") as f:
                f.write(
                    problem_info,
                )
                f.write(problem_content)
                f.write("\n")
    except HTTPError as e:
        print(f"Not Found, http error {e}")
