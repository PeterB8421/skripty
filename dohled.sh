#!/bin/bash

cas=`date +%T" "%D`
ip=`ifconfig | grep Všesměr | awk -F ":" '{print $2}' | awk -F " " '{print $1}'`
rx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'`
tx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`
users=`who | wc -l`
wholedisk=`df -h | grep sda1| awk -F " " '{print $2}'`
useddisk=`df -h | grep sda1| awk -F " " '{print $3}'`
freedisk=`df -h | grep sda1| awk -F " " '{print $4}'`
procentdisk=`df -h | grep sda1| awk -F " " '{print $5}'`
wholeram=`free -m | grep Mem | awk -F " " '{print $2}'`
usedram=`free -m | grep Mem | awk -F " " '{print $3}'`
freeram=`free -m | grep Mem | awk -F " " '{print $4}'`

echo "Aktuální čas: "$cas >> dohled
echo "Moje IP: "$ip >> dohled
echo "_____________________________________" >> dohled
echo "Přijatá data: "$rx >> dohled
echo "Odeslaná data: "$tx >> dohled
echo "_____________________________________" >> dohled
echo "Počet přihlášených uživatelů: "$users >> dohled
echo "_____________________________________" >> dohled
echo "Statistiky disku: " >> dohled
echo "Celkové místo na disku: "$wholedisk >> dohled
echo "Využité místo na disku: "$useddisk >> dohled
echo "Volné místo na disku: "$freedisk >> dohled
echo "Využité místo na disku v %: "$procentdisk >> dohled
echo "_____________________________________" >> dohled
echo "Statistiky paměti RAM: " >> dohled
echo "Celková paměť RAM: "$wholeram" MB" >> dohled
echo "Použitá paměť RAM: "$usedram" MB" >> dohled
echo "Volná paměť RAM: "$freeram" MB" >> dohled

