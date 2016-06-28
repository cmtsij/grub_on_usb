#!/bin/bash

#include api
. ./.upgrade_iso.api


## global setting
iso_file="systemrescuecd.iso"
new_iso_file="${iso_file}.new"
source_link="http://www.sysresccd.org/Download"
source_file="/tmp/.cachepage"

## get download page, or use cached files
if [ ! -e $source_file ]; then
	wget -q "$source_link" -O "$source_file"
	# remove last download
	rm -f $new_iso_file
else
	echo "Using cached source page [$source_file] instead of [$source_link]"
fi

## parse iso image link
iso_link=$(cat $source_file | tr -d "\n" | tr -d "\n" | sed -e "s/>/\0\n/g" | grep -o '\"http[s]\?://.\+\.iso[^"]\+\"' | tr -d "\"" | head -n 1 )
new_iso_version="$(echo $iso_link | grep -o '[0-9]\+\.[0-9\.]\+' | head -n 1)"

## Show current ISO version
echo "New ISO version: $new_iso_version" 

## Get old iso version
iso_version=$(cat version)
echo "Current ISO version: $iso_version"

## check iso version
if [ "$iso_version" = "$new_iso_version" ]; then
	echo "Same version, skip upgrade"
	exit
fi

## download iso image to tmpfile
echo "Using Download url=[$iso_link]"
echo "Download to [$new_iso_file]"
wget --progress=bar:force -v -c -O $new_iso_file $iso_link 2>&1 | api_progressfilt

## check md5sum
md5=$(md5sum "$new_iso_file" | cut -d " " -f 1)
echo "MD5=$md5 "
echo -n "Verify ISO image with md5sum"
if [ -z $(grep -i "$md5" "$source_file") ]; then
	echo "...fail"
	exit 1
fi
echo "...pass"

## update ISO and version file
echo "Override current ISO with Downloaded ISO: [$new_iso_file]->[$iso_file]"
mv "$new_iso_file" "$iso_file"
echo $new_iso_version > version


	