#!/bin/bash

total=$(free | grep -vE 'total' | grep -vE 'Swap' | awk '{print $2}')
used=$(free | grep -vE 'total' | grep -vE 'Swap' | awk '{print $3}')

let percent=$(echo "scale=0 ; $used * 100 / $total" | bc)
printf "%.0f%s" $percent "%"
