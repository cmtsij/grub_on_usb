#!/bin/sh
device=${1:-/dev/sda}

read -n 1 -p "Device is \"$device?\" [y/n]: " prompt
echo

SUDO=$(which sudo)

if [ "$prompt" = "y" ]; then
	${SUDO} sh -x wee.sh -s wee_script.txt -d $device -f -v -u
fi
