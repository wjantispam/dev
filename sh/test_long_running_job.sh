#!/usr/bin/env bash
i=1
while [[ $i -le 30 ]]; do
	echo Running $i....
	let i+=1
	sleep 1
done
