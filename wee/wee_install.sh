#!/bin/sh
device=${1:-/dev/sda}

read -n 1 -p "Device is \"$device?\" [y/n]: " prompt
echo

if [ "$prompt" = "y" ]; then
	sudo sh -x wee.sh -s wee_script.txt -d $device -f -v -u
fi
