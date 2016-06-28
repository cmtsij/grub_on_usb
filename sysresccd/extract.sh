#!/bin/bash

iso=${1:-systemrescuecd.iso}

rm -rf iso 
7z x $iso -oiso isolinux/initram.igz isolinux/{rescue32,rescue64,altker32,altker64} bootdisk/*
