#!/bin/bash

# Greatest common divisor
function gcd_() {
    if [ $# -ne 2 ]; then 
      echo "Usage: gcd <number1> <number2>" 1>&2
      exit 1
    fi
    local a=$1
    local b=$2
    while [ "$b" -ne 0 ]; do
        local t=$b
        b=$((a % b))
        a=$t
    done
    echo "$a"
}

function ratio_() {
    if [ $# -ne 2 ]; then
      echo "Usage: gcd <number1> <number2>" 1>&2
      exit 1
    fi
    local a=$1
    local b=$2
    local gcd
    gcd=$(gcd_ "$a" "$b")
    echo "$((a / gcd)):$((b / gcd))"
}
