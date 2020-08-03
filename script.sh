#!/bin/bash

function kural() {
  randNum=`shuf -i 1-1330 -n 1`
  num=$((${1:-${randNum}}-1))
  oneTag='# '
  echo ${oneTag}$((${num}+1)) > /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${randNum}
  tag='## ' 
  line=`cat /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | jq --argjson index "$num" '.kural[$index] | .Line1 + " " + .Line2' | sed -e 's/^"//' -e 's/"$//'` 
  fullLine=${tag}${line}
  dash="- "
  trans1=$(cat /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | jq --argjson index "$num" '.kural[$index] | .mk' | sed -e 's/^"//' -e 's/"$//')
  trans2=$(cat /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | jq --argjson index "$num" '.kural[$index] | .sp' | sed -e 's/^"//' -e 's/"$//')
  trans3=$(cat /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | jq --argjson index "$num" '.kural[$index] | .mv' | sed -e 's/^"//' -e 's/"$//')
  trans4=$(cat /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | jq --argjson index "$num" '.kural[$index] | .Translation' | sed -e 's/^"//' -e 's/"$//')
  echo ${fullLine} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans1} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans2} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans3} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans4} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  (okular /home/veera/Projects/.ThirukkuralAPI/kural.md &)
}
