#!/usr/bin/env bash
A=$(<"${1:-3.txt}")
solve() {
    # X is an associated array, initially it has key='x0y0' value=1
    local -A X=([x0y0]=1)
    local x=(0 0) y=(0 0) n=0 N=$1
    while read -r -n1 i; do
        # n is always 0?
        ((n=(n+1)&N))
        # Produce a dictionary with keys like
        # keys: x2y2 x1y2 x1y1 x0y2 x0y0 x0y1 x3y2
        case "$i" in
            ">") ((++x[n]));;
            "<") ((--x[n]));;
            "^") ((++y[n]));;
            "v") ((--y[n]));;
        esac
        # +=1 is not increament but to concatenate
        # bash-5.2$ declare -A X=([x0y0]=1)
        # bash-5.2$ X[x0y0]+=1
        # bash-5.2$ echo ${!X[@]}
        # x0y0
        # bash-5.2$ echo ${X[@]}
        # 11
        X[x${x[n]}y${y[n]}]+=1;
    done <<< "$A"
    ANS=${#X[@]}
}
solve 0
echo "3A: $ANS"
# solve 1
# echo "3B: $ANS"
