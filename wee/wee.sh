#!/bin/sh

mkdir -p /tmp/wee
cp bin/* wee_script.txt /tmp/wee
cd /tmp/wee
chmod 755 weesetup
./weesetup $@
