#!/bin/bash
clear
echo "Dobrý den, jsem GNU/Linux Ubuntu a chci ti něco říct ke tvému věku."
echo "Zadejte svuj vek: "
read vek
do
	if [ $vek -gt 0 ] && [ $vek -lt 16 ]; then
		echo "Je vám <0;15> let." >> odpovedi.txt

	else
		echo "Pro vas vek nemame hlasku :(" >> odpovedi.txt
	fi
done
