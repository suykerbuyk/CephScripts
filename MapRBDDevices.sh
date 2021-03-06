#!/bin/bash

# Map RBD Devices

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
  echo This script will map all the RBD devices in a given pool to the host
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be mapped
  echo
  exit 1
fi

for RBDDevname in $(rbd ls -p $Poolname)
do
    echo $RBDDevname
    rbd device map $Poolname/$RBDDevname
done