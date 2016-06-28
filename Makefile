GRUB4DOS_URL:=http://dl.grub4dos.chenall.net/
GRUB4DOS_PACKAGE:=grub4dos-0.4.6a-2015-02-17.7z

all:
	@echo "Usage:"
	@echo "make install_grub4dos        # downlaod and install grub4dos"
	@echo "make generate_default        # generate *.default from grub4dos"

install_grub4dos:
	wget -q -N $(GRUB4DOS_URL)/$(GRUB4DOS_PACKAGE) -O $(GRUB4DOS_PACKAGE)
	sh extract_grub4dos.sh $(GRUB4DOS_PACKAGE)
	
generate_default:
	[ -e auto_boot_parition.default ] || cp grub4dos/sample/default auto_boot_parition.default
	[ -e sub_menu.default ] || cp grub4dos/sample/default sub_menu.default
