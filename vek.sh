#Dobrý den!
#!/bin/bash
clear
echo "Dobrý den, jsem GNU/Linux Ubuntu a chci ti něco říct ke tvému věku."
echo "Zadejte svuj vek: "
read vek
if [ $vek -lt 0 ]; then
	echo "WAT???"
fi

if [ $vek -le 14 ] && [ $vek -ge 0 ]; then
	echo "Jste dite."
fi

if [ $vek -ge 15 ] && [ $vek -le 17 ]; then
	echo "Jste mladistvy."
fi

if [ $vek -ge 18 ] && [ $vek -le 120 ]; then
	echo "Jste dospělí."
fi

if [ $vek -gt 120 ]; then
	echo "Runtime error 415 - too large number! Or bad value!"
fi
