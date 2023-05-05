#!/usr/bin/env python3
import collections

import pytest


from typing import List, Tuple


def minimum_rooms_required(intervals: List[Tuple[int, int]]) -> int:
    delta_room_map = {}
    max_rooms = 0
    curr_rooms = 0
    # updating time map
    for start, end in intervals:
        if start not in delta_room_map:
            delta_room_map[start] = 0
        delta_room_map[start] += 1
        if end not in delta_room_map:
            delta_room_map[end] = 0
        delta_room_map[end] -= 1
    # generating the minimum number of rooms required
    sorted_events = sorted(delta_room_map.items(), key=lambda x: x[0])
    for _, rooms in sorted_events:
        curr_rooms += rooms
        max_rooms = max(max_rooms, curr_rooms)
    return max_rooms

@pytest.mark.parametrize(
	('intervals', 'max_rooms'),
	(
		([(10,20),(5,10)], 1), # if class A and class 2 start end at the same time
		([(0,30),(31,40)], 1),
		([(10,30),(31,40)], 1),
		([(0,30),(10,20)], 2),
	),
)
def test_simple_room_cases(intervals, max_rooms):
	assert minimum_rooms_required(intervals) == max_rooms


@pytest.mark.parametrize(
	('intervals', 'max_rooms'),
	(
		([(30,75),(0,50),(60,150)], 2),	
	)
)
def test_complex_cases(intervals, max_rooms):
	assert minimum_rooms_required(intervals) == max_rooms
