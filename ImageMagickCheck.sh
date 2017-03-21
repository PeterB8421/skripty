#!/bin/bash
check=`apt list | grep imagemagick`
if [[ $check ]]; then
echo "1" > .check
else
sudo apt install imagemagick
fi
