# BOOTICE
# 	ref: http://bbs.wuyou.net/forum.php?mod=viewthread&tid=57675
#   mirror: 
#
SUPER_GRUB2_DISK=super_grub2_disk_hybrid_2.02s3.iso
SUPER_GRUB2_MD5SUM=e7515b7d4e9ea90f28b7f5a534906b85
SUPER_GRUB2_DISK_URL=https://github.com/cmtsij/grub_on_usb_mirror/raw/master/super_grub2_disk/$(SUPER_GRUB2_DISK)


all:

super_grub2_disk_install:
	wget -q -N $(SUPER_GRUB2_DISK_URL) -O $(SUPER_GRUB2_DISK)
	@[ "$(SUPER_GRUB2_MD5SUM)" = "$$(md5sum $(SUPER_GRUB2_DISK) | awk '{print $$1}' )" ] || (echo md5sum is incorret && exit 1)

super_grub2_disk_clean:
	rm -f $(SUPER_GRUB2_DISK)

clean:
	echo "Do nothing"
	
distclean: clean super_grub2_disk_clean
