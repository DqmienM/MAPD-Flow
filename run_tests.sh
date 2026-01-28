#!/bin/bash

for i in {100..600..100}; do
  ./build/lifelong --inputFile ./instances/warehouseSmall/warehouseSmall_${i}.json -o outputs/ws{$i}.json --scheduleModel 6 --simulationTime 1000 --networkTimeSteps 10
done