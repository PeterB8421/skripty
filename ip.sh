#!/bin/bash
ip=`ifconfig | grep inet | awk -F ":" '{print $2}' | awk -F " " '{print $1}' | head -n 1`
stats=`ifconfig | grep bajtů | awk -F "(" '{print $2}' | awk -F ")" '{print $1}' | head -n 1`
echo "Moje IP je: "$ip
echo "Přijato: "$stats
statso=`ifconfig | grep bajtů | awk -F "(" '{print $3}' | awk -F ")" '{print $1}' | head -n 1`
echo "Odesláno: "$statso
