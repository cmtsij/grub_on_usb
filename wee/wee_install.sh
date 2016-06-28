#!/bin/sh
device=${1:-/dev/sda}

printf "Device is \"$device?\" [y/n]: "
read prompt

SUDO=$(which sudo)

if [ "$prompt" = "y" ]; then
	${SUDO} sh -x wee.sh -s wee_script.txt -d $device -f -v -u
fi
