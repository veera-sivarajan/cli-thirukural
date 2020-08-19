#!/bin/bash

function kural() {
  randNum=`shuf -i 1-1330 -n 1` # generate random number in range 1-1330 inclusive
  num=$((${1:-${randNum}}-1)) # use argument or random number-1
  oneTag='# '
  echo ${oneTag}$((${num}+1)) > /home/veera/Projects/.ThirukkuralAPI/kural.md # write s.no to file
  tag='## ' 
  line=`jq --argjson index "$num" '.kural[$index] | .Line1 + " " + .Line2' /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | sed -e 's/^"//' -e 's/"$//'` # get thirukural from json obj
  fullLine=${tag}${line}
  dash="- "

  # get all translations
  trans1=$(jq --argjson index "$num" '.kural[$index] | .mk' /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | sed -e 's/^"//' -e 's/"$//')
  trans2=$(jq --argjson index "$num" '.kural[$index] | .sp' /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | sed -e 's/^"//' -e 's/"$//')
  trans3=$(jq --argjson index "$num" '.kural[$index] | .mv' /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | sed -e 's/^"//' -e 's/"$//')
  trans4=$(jq --argjson index "$num" '.kural[$index] | .Translation' /home/veera/Projects/.ThirukkuralAPI/thirukkural.json | sed -e 's/^"//' -e 's/"$//')

  # append all details to the file
  echo ${fullLine} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans1} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans2} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans3} >> /home/veera/Projects/.ThirukkuralAPI/kural.md
  echo ${dash}${trans4} >> /home/veera/Projects/.ThirukkuralAPI/kural.md

  # open the file in okular
  (okular /home/veera/Projects/.ThirukkuralAPI/kural.md &)
}
