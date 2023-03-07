#!/usr/bin/env python3
"""
Problem:
Given an array of integers, return a new array such that each element at index
i of the new array is the product of all the numbers in the original array
except the one at i.
For example, if our input was [1, 2, 3, 4, 5], the expected output would be
[120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be
[2, 3, 6].
Follow-up: what if you can't use division?
"""

import pytest
from pprint import pprint
from typing import List

def product_of_rest_list(array:List) -> List:
    # At each pos we can think it has pos_left and pos_right
    # and the result at the pos is pos_left x pos_right
    
    # store an array that contains all the results from pos_left
    # basically doing sumx operation

    # For array = [1, 2, 3, 4, 5]
    # 
    # [][x][2345]
    # [1][x][345]
    # [12][x][45]
    # [123][x][5]
    # [1234][x][]
    
    # Cover edge cases
    if array == []: return []

    # returns [1,2,6,24]
    list_pos_left = []
    pos_val = 1
    for idx in array[:-1]:
        pos_val *= idx
        list_pos_left.append(pos_val)
    list_pos_left.insert(0,1)

    # returns [5,20.60,120]
    list_pos_right = []
    pos_val = 1
    # TODO: how to take the last n-1 items?
    for idx in array[-1:0:-1]:
        pos_val *= idx
        list_pos_right.append(pos_val)
    list_pos_right.insert(0,1)

    # TODO: How do you multiply each item?
    # pprint(f"{list_pos_left}")
    # pprint(f"{list_pos_right}")
   
    # BAGA: both a and b returns None 
    # a = list_pos_left.append(1)
    # b = [1].append(list_pos_right)
   
    ans = []
    n = len(list_pos_right)
    for idx in range(n):
       ans.append(list_pos_left[idx]*list_pos_right[n-1-idx]) 
    
    return ans

@pytest.mark.parametrize(
    ('array', 'expected'),
    (
        ([1,2,3,4,5],[120,60,40,30,24]),
        ([3,2,1],[2,3,6]),
    ),
)
# BAGA: You have to prefix it with test_, or test will be skipped
def test_simple_cases(array, expected):
    assert product_of_rest_list(array) == expected



@pytest.mark.parametrize(
    ('array', 'expected'),
    (
        ([],[]),
        ([1, 1],[1, 1]),
    ),
)
def test_edge_cases(array, expected):
    assert product_of_rest_list(array) == expected






# def main():
#     ans = product_of_rest_list([1,1])
#     print(ans)
#     
# if __name__ == '__main__':
#     exit(main())
