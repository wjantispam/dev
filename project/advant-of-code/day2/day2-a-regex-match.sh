#!/usr/bin/env bash
debug=0
min () {
    min=$1
    shift
    while (( $# )); do
        min=$(( $1 < min ? $1 : min ))
        shift
    done
    echo "$min"
}

regex='([[:digit:]]+)x([[:digit:]]+)x([[:digit:]]+)'
total=0
debug=0

while read -r line; do
    (( debug )) && echo "Line: $line" >&2
    [[ "$line" =~ $regex ]]
    dim1=${BASH_REMATCH[1]}
    dim2=${BASH_REMATCH[2]}
    dim3=${BASH_REMATCH[3]}
    s1=$(( dim1 * dim2 ))
    s2=$(( dim1 * dim3 ))
    s3=$(( dim2 * dim3 ))
    smallest=$(min $s1 $s2 $s3)
    (( total += 2 * (s1 + s2 + s3) + smallest ))
    (( debug )) && echo "Sum: $total" >&2
done < "$1"

echo "Total square footage needed: $total"
