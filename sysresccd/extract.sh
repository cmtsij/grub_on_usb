#!/bin/bash

iso=${1:-systemrescuecd.iso}

rm -rf iso 
7z x $iso -oiso isolinux/initram.igz isolinux/rescue32 isolinux/rescue64 bootdisk/*
