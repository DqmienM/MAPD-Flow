#!/bin/bash

#APPEND RESULTS TO CSV FILES

for i in {100..600..100}; do
  for j in {1..5}; do
    for k in {1,5,10,20,40}; do
      data=$(head -5 outputs/ws${i}_${k}_${j}.json | tail -1 | cut -c 24- | cut -d "," -f 1)
      if [ ${k} -eq 40 ]; then
	delim=$'\n'
      else
	delim=','
      fi
      printf "${data}${delim}" >> "data_analysis/ws${i}_data.csv"
    done
  done
done
