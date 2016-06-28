# BOOTICE
# 	ref: http://bbs.wuyou.net/forum.php?mod=viewthread&tid=57675
#   mirror: 
#
BOOTICE_x86=BOOTICEx86_v1.332.rar
BOOTICE_x64=BOOTICEx64_v1.332.rar
BOOTICE_x86_URL=https://github.com/cmtsij/grub_on_usb_mirror/raw/master/bootice/$(BOOTICE_x86)
BOOTICE_x64_URL=https://github.com/cmtsij/grub_on_usb_mirror/raw/master/bootice/$(BOOTICE_x64)

bootice_install:
	wget -q -N $(BOOTICE_x86_URL) -O $(BOOTICE_x86)
	wget -q -N $(BOOTICE_x64_URL) -O $(BOOTICE_x64)
	unrar x -y $(BOOTICE_x86)
	unrar x -y $(BOOTICE_x64)
	

bootice_clean:
	rm -f BOOTICE*.exe

clean:
	rm -f *.rar
	
distclean: clean bootice_clean
