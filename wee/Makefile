GRUBUTILS_DIR=grubutils
GRUBUTILS_GIT=https://github.com/cmtsij/$(GRUBUTILS_DIR)

all:
	@echo "Usage:"
	@echo "make install             # downlaod,build and install wee"
	@echo "make clean               # clean download and build"
	@echo "make distclean           # clean downlaod, build and installed wee"

install: install_linux install_windows

.PHONY: $(GRUBUTILS_DIR)

clone:
	# download
	if [ ! -f $(GRUBUTILS_DIR)/.git/.cloned ]; then\
	fi

$(GRUBUTILS_DIR)/.git/.cloned:
	rm -rf $(GRUBUTILS_DIR)
	git clone $(GRUBUTILS_GIT)
	touch $(GRUBUTILS_DIR)/.git/.cloned


build_linux: $(GRUBUTILS_DIR)/.git/.cloned
	# patch
	# for file in patches/*; do cat $$file | (cd $(GRUBUTILS_DIR) && git am -k); done
	#make -C  $(GRUBUTILS_DIR)
	make -C $(GRUBUTILS_DIR)/grubutils/wee
	make -C $(GRUBUTILS_DIR)/grubutils/weesetup clean
	make -C $(GRUBUTILS_DIR)/grubutils/weesetup
	make -C $(GRUBUTILS_DIR)/grubutils/grubinst

build_windows: $(GRUBUTILS_DIR)/.git/.cloned
	@x86_64-w64-mingw32-gcc -v >/dev/null 2>&1 || (printf "Error: Please install missing package:\n\tapt-get install mingw-w64\n" && exit 1)
	make -C $(GRUBUTILS_DIR)/grubutils/wee
	make -C $(GRUBUTILS_DIR)/grubutils/weesetup clean
	make -C $(GRUBUTILS_DIR)/grubutils/weesetup OSTYPE=MINGW CC=x86_64-w64-mingw32-gcc

install_linux: build_linux
	mkdir -p bin
	cp $(GRUBUTILS_DIR)/grubutils/wee/wee{63,127}.mbr bin/
	cp $(GRUBUTILS_DIR)/grubutils/weesetup/weesetup bin/
	cp $(GRUBUTILS_DIR)/grubutils/grubinst/grubinst bin/
	cp $(GRUBUTILS_DIR)/grubutils/grubinst/grubmenu bin/


install_windows: build_windows
	mkdir -p bin
	cp $(GRUBUTILS_DIR)/grubutils/weesetup/weesetup.exe bin/

clean:
	#-cd $(GRUBUTILS_DIR) && git clean -xfd
	rm -rf $(GRUBUTILS_DIR)

distclean: clean
	# clean installed
	rm -rf bin doc
	
