#!/usr/bin/env bash

ctrlc_count=0

trap no_ctrlc SIGINT

function no_ctrlc() {
    let ctrlc_count++
    echo
    if [[ $ctrlc_count == 1 ]]; then
        echo "Stop that."
    elif [[ $ctrlc_count == 2 ]]; then
        echo "Once more then I quit."
    else
        echo "That's it. I quit"
        exit
    fi

}

while true; do
    echo Sleeping
    sleep 2
done

: <<-NOTWORKING
while sleep 1; do
    echo Sleeping ...
done
NOTWORKING
