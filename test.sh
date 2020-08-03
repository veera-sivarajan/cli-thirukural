#!/bin/bash
randNum=`shuf -i 0-100 -n 1`
num=${1:-${randNum}}
echo ${num}
echo $((${num} + 1)) 
