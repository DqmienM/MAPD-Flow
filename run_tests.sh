#!/bin/bash

# RUN TESTS
N=8

for i in {100..600..100}; do 
  for j in {1,5,10,20,40}; do
    for k in {1..5}; do
      ((n=n%N)); ((n++==0)) && wait
      ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_${j}_${k}.json --scheduleModel 6 --simulationTime 1000 --networkTimeSteps ${j} &
    done 
  done
done


#for i in {100..600..100}; do 
#  for k in {1..5}; do
#    ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_0_${k}.json --scheduleModel 1 --simulationTime 1000
#  done 
#done

