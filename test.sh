#!/bin/bash
num=10
line=`cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .Line1 + " " + .Line2' | sed -e 's/^"//' -e 's/"$//'`
echo ${line}
