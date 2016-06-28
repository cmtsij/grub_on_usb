#!/bin/sh

iso="$1"

rm -rf iso && 7z x $iso -oiso casper/initrd.lz casper/vmlinuz
