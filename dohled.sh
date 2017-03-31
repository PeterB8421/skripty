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

echo "<div class="obal">" >> html/index.html
echo "-------------------------------------" >> html/index.html
echo "<br>" >> html/index.html
echo "Aktuální čas: "$cas >> html/index.html
echo "<br>" >> html/index.html
echo "Moje IP: "$ip >> html/index.html
echo "<br>" >> html/index.html
echo "_____________________________________" >> html/index.html
echo "<br>" >> html/index.html
echo "Přijatá data: "$rx >> html/index.html
echo "<br>" >> html/index.html
echo "Odeslaná data: "$tx >> html/index.html
echo "<br>" >> html/index.html
echo "_____________________________________" >> html/index.html
echo "<br>" >> html/index.html
echo "Počet přihlášených uživatelů: "$users >> html/index.html
echo "<br>" >> html/index.html
echo "_____________________________________" >> html/index.html
echo "<br>" >> html/index.html
echo "Statistiky disku: " >> html/index.html
echo "<br>" >> html/index.html
echo "Celkové místo na disku: "$wholedisk >> html/index.html
echo "<br>" >> html/index.html
echo "Využité místo na disku: "$useddisk >> html/index.html
echo "<br>" >> html/index.html
echo "Volné místo na disku: "$freedisk >> html/index.html
echo "<br>" >> html/index.html
echo "Využité místo na disku v %: "$procentdisk >> html/index.html
echo "<br>" >> html/index.html
echo "_____________________________________" >> html/index.html
echo "<br>" >> html/index.html
echo "Statistiky paměti RAM: " >> html/index.html
echo "<br>" >> html/index.html
echo "Celková paměť RAM: "$wholeram" MB" >> html/index.html
echo "<br>" >> html/index.html
echo "Použitá paměť RAM: "$usedram" MB" >> html/index.html
echo "<br>" >> html/index.html
echo "Volná paměť RAM: "$freeram" MB" >> html/index.html
echo "<br>" >> html/index.html
echo "-------------------------------------" >> html/index.html
echo "</div>" >> html/index.html
echo "<br>" >> html/index.html
echo "<br>" >> html/index.html

