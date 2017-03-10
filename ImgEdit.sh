#!/bin/bash
choice=55
until [ $choice == e ]; do
	clear
	echo "__________Welcome to image editor, choose what you want to do: __________"
	echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
	echo "|									      |"
	echo "| (1) Change resolution						      |"
	echo "| (2) Use effect							      |"
	echo "| (3) Convert to other format					      |"
	echo "| (4) Rotate							      |"
	echo "| (5) Change quality						      |"
	echo "|-----------------------------------------------------------------------|"
	echo "| (e) Exit	(Ctrl+c) Emergency exit				      |"
	echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
	echo "Your choice: "
	read choice
	if [ $choice == 1 ]; then
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		echo "Write new resolution: "
		read resolution
		convert $path -resize $resolution $path
		echo "Your image resolution has changed!"
	elif [ $choice == 2 ]; then
		echo "-----------------------------------"
		echo "|		Effects MENU		|"
		echo "|					|"
		echo "|	(c) Charcoal			|"
		echo "| (i) Implosion			|"
		echo "|---------------------------------|"
		echo "| (b) Back			|"
		echo "-----------------------------------"
		echo "Choose one: "
		read choice
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		if [ $choice == c ]; then
			echo "Write nuber of strength of the charcoal effect: "
			read strength
			convert $path -charcoal $strength charcoal-$path
			echo "Charcoal effect applied!"
		elif [ $choice == i ]; then
			echo "Write nuber of strength of the charcoal effect: "
			read strength
			convert $path -implode $strength implosion-$path
			echo "Implosion (black hole) effect applied!"
		fi
	fi
done
