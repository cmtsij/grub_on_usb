# BOOTICE
# 	ref: http://bbs.wuyou.net/forum.php?mod=viewthread&tid=57675
#   mirror: 
#
SUPER_GRUB2_DISK=super_grub2_disk_hybrid_2.02s4_sysrescuecd.iso
SUPER_GRUB2_MD5SUM=bbd1f2cdcd0d1ce087f65f7f63fa5c10
SUPER_GRUB2_DISK_URL=https://github.com/cmtsij/grub_on_usb_mirror/raw/master/super_grub2_disk/$(SUPER_GRUB2_DISK)


all:
	@echo "Usage:"
	@echo "make install      # downlaod and install super grub2 disk"
	@echo "make clean        # clean installed super grub2 disk"

install: super_grub2_disk_install

clean: super_grub2_disk_clean

super_grub2_disk_install:
	wget -q -N $(SUPER_GRUB2_DISK_URL) -O $(SUPER_GRUB2_DISK)
	@[ "$(SUPER_GRUB2_MD5SUM)" = "$$(md5sum $(SUPER_GRUB2_DISK) | awk '{print $$1}' )" ] || (echo md5sum is incorret && exit 1)

super_grub2_disk_clean:
	rm -f $(SUPER_GRUB2_DISK)
	
distclean: clean super_grub2_disk_clean
