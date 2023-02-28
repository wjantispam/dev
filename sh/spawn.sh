#!/usr/bin/env bash

MAXTIME=30 # MAX of 30 sec
# TODO: this pidof doesn't work, why? 
PIDS=$(pidof bash $0)
echo "script $0 pid is: $PID"

s=1
while [[ s -le $MAXTIME ]]; do
  sleep 1
  echo Sleeping $s
  let s+=1
done

