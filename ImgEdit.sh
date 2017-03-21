#!/bin/bash
function check {
a=`echo $path | awk -F "." '{print $2}' | awk -F " " '{print $1}'`
if [[ $a == "jpg" ]] || [[ $a == "png" ]] || [[ $a == "JPG" ]] || [[ $a == "PNG" ]] || [[ $a == "*" ]]; then
valid=1
else
valid=0
echo "Wrong type of file!"
fi
return $valid
}

function ending {
if [[ $choice == 1 ]]; then
end="jpg"
elif [[ $choice == 2 ]]; then
end="png"
fi
npath=`echo $path | awk -F "." '{print $1}'`
if [[ $choice == 1 ]]; then
convert $path $npath.jpg
elif [[ $choice == 2 ]]; then
convert $path $npath.png
fi
return
}

function formatCheck {
a=`echo $path | awk -F "." '{print $2}' | awk -F " " '{print $1}'`
if [ $choice == 1 ]; then
	if [[ $a == "png" ]] || [[ $a == "PNG" ]]; then
	valid=1
	else
	valid=0
	echo "Wrong type of file!"
	fi
elif [ $choice == 2 ]; then
	if [[ $a == "jpg" ]] || [[ $a == "JPG" ]]; then
        valid=1
        else
        valid=0
        echo "Wrong type of file!"
	fi
fi
return $valid
}

choice=55
until [ $choice == e ]; do
	valid=2
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
		until [ $valid == 1 ]; do
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		check
		done
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
		echo "Choose one: "
		read choice
		until [ $valid == 1 ]; do
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		check
		done
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
		read choice
		until [ $valid == 1 ]; do
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		formatCheck
		done
		ending
		echo "Image converted!"
	elif [ $choice == 4 ]; then
		echo "ROTATE"
		until [ $valid == 1 ]; do
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		check
		done
		echo "Write number of degrees to rotate the image: "
		read rotate
		convert $path -rotate $rotate $path
		echo "Image rotated!"
	elif [ $choice == 5 ]; then
		echo "QUALITY"
		until [ $valid == 1 ]; do
		echo "Write path to your image (if you want to change all images, write *.[format]): "
		read path
		check
		done
		echo "Write number for quality in the image: "
		read quality
		convert $path -quality $quality $path
		echo "Quality changed!"
	fi
done
