all:
	@echo "Usage:"
	@echo "make install_all	        # downlaod and install grub4dos/wee/sysresccd"
	@echo "make generate_default    # generate *.default from grub4dos"

install_all:
	## install grub4dos
	make -C grub4dos install
	## install wee
	make -C wee install
	## install sysresccd
	make -C sysresccd install

	## generate menu default file
	make generate_default
	
generate_default:
	[ -e auto_boot_parition.default ] || cp grub4dos/grub4dos/sample/default auto_boot_parition.default
	[ -e sub_menu.default ]           || cp grub4dos/grub4dos/sample/default sub_menu.default
