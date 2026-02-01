#!/bin/bash

# Finish off simulating 10 time-steps 5 times each for WS

for i in {300..600..100}; do
  for j in {2..5}; do
    ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_${j}_10.json --scheduleModel 6 --simulationTime 1000 --networkTimeSteps 10
  done
done

# Simulate static tests 5 times each for WS

for i in {100..600..100}; do
  for j in {1..5}; do
    ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_${j}_old.json --scheduleModel 1 --simulationTime 1000
  done
done

# Simulate 20 and 40 timesteps 5 times each for WS
for i in {100..600..100}; do
  for j in {20,40}; do
    for k in {1..5}; do
      ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws${i}_${k}_${j}.json --scheduleModel 6 --simulationTime 1000 --networkTimeSteps ${j} 
    done
  done
done
