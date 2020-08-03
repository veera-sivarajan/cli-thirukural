#!/bin/bash

function kural() {
  num=1
  tag='# ' 
  line=`cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .Line1 + " " + .Line2' | sed -e 's/^"//' -e 's/"$//'` 
  fullLine=${tag}${line}
  dash="- "
  trans1=$(cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .mk' | sed -e 's/^"//' -e 's/"$//')
  trans2=$(cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .sp' | sed -e 's/^"//' -e 's/"$//')
  trans3=$(cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .mv' | sed -e 's/^"//' -e 's/"$//')
  trans4=$(cat thirukkural.json | jq --argjson index "$num" '.kural[$index] | .Translation' | sed -e 's/^"//' -e 's/"$//')
  echo ${fullLine} > kural.md
  echo ${dash}${trans1} >> kural.md
  echo ${dash}${trans2} >> kural.md
  echo ${dash}${trans3} >> kural.md
  echo ${dash}${trans4} >> kural.md
}
