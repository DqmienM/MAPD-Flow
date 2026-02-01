#!/bin/bash

# RUN TESTS

for i in {100..600..100}; do 
  for j in {5,10,20,40}; do
    for k in {1..5}; do
      ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_${j}_${k}.json --scheduleModel 6 --simulationTime 1000 --networkTimeSteps ${j}
    done 
  done
done


for i in {100..600..100}; do 
  for k in {1..5}; do
    ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_1_${k}.json --scheduleModel 1 --simulationTime 1000
  done 
done

# APPEND RESULTS TO CSV FILES

for i in {100..600..100}; do
  for j in {1..5}; do
    for k in {1,5,10,20,40}; do
      data=$(head -5 outputs/ws${i}_${k}_${j}.json | tail -1 | cut -c 24- | cut -d "," -f 1)
      if [ ${k} -eq 40 ]; then
        delim=$'\n'
      else
        delim=','
      fi	
      printf "%s$delim" "$data" >> "data_analysis/ws${i}_data.csv"
    done
  done
done
