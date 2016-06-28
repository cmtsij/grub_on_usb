#ref: http://grub4dos.chenall.net/
GRUB4DOS_URL:=http://dl.grub4dos.chenall.net/
GRUB4DOS_PACKAGE:=grub4dos-0.4.6a-2015-10-21.7z

all:
	@echo "Usage:"
	@echo "make install      # downlaod and install grub4dos"
	@echo "make clean        # clean installed grub4dos"

install:
	wget -q -N $(GRUB4DOS_URL)/$(GRUB4DOS_PACKAGE) -O $(GRUB4DOS_PACKAGE)
	sh extract_grub4dos.sh $(GRUB4DOS_PACKAGE)
	
clean:
	git clean -xfd .
