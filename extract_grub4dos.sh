#!/bin/bash

set -e

bin_7z=${1:-"grub4dos-*.7z"}

if [ ! -e $bin_7z ]; then
	echo file is not exist: $bin_7z
	exit 1
fi

new_grub4dos=$(7z t $bin_7z | grep ^Testing | sort | head -n 1 | awk '{print $2}')
7z x -y $bin_7z > /dev/null
rm -rf grub4dos
mv $new_grub4dos grub4dos
mv $bin_7z grub4dos
