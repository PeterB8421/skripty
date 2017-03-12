#!/bin/bash
choice=55
until [ $choice == e ]; do
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
	clear
	if [ $choice == 1 ]; then
		echo "RESOLUTION"
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
			echo "Write number of strength of the charcoal effect: "
			read strength
			convert $path -charcoal $strength $path
			echo "Charcoal effect applied!"
		elif [ $choice == i ]; then
			echo "Write number of strength of the implosion effect: "
			read strength
			convert $path -implode $strength $path
			echo "Implosion (black hole) effect applied!"
		fi
	elif [ $choice == 3 ]; then
		echo "Format MENU"
		echo "(1) png -> jpg"
		echo "(2) jpg -> png"
		echo "--------------"
		echo "(b) Back"
		read choice
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		if [ $choice == 1 ]; then
			echo "Enter quality of converted image: "
			read quality
			convert $path -quality $quality $path.jpg
		elif [ $choice == 2 ]; then
			convert $path $path.png
		fi
		echo "Image converted!"
	elif [ $choice == 4 ]; then
		echo "ROTATE"
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		echo "Write number of degrees to rotate the image: "
		read rotate
		convert $path -rotate $rotate $path
		echo "Image rotated!"
	elif [ $choice == 5 ]; then
		echo "QUALITY"
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		echo "Write number for quality in the image: "
		read quality
		convert $path -quality $quality $path
		echo "Quality changed!"
	fi
done
