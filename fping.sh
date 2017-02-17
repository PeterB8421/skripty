#!/bin/bash
echo "Zadejte libovolne cislo: "
read in1
echo "Zadejte libovolne cislo: "
read in2
echo "Zadejte libovolne cislo: "
read in3
for (( i=1; i<=254; i++ ))
do
ping $in1.$in2.$in3.$i -c 1 >> $in1.$in2.$in3.x.txt
done
