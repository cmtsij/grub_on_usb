GRUBUTILS_DIR=grubutils
GRUBUTILS_REV=115
GRUBUTILS_SVN=http://$(GRUBUTILS_DIR).googlecode.com/svn/$(GRUBUTILS_DIR)

WEESETUP_URL:=https://grubutils.googlecode.com/files
WEESETUP_PACKAGE:=weesetup-2013-09-25.zip

all:
	@echo "Usage:"
	@echo "make install             # downlaod,build and install wee"
	@echo "make clean               # clean download and build"
	@echo "make distclean           # clean downlaod, build and installed wee"

install: install_linux install_windows
	make clean

$(GRUBUTILS_DIR)_build:
	# clean last one
	rm -rf $(GRUBUTILS_DIR)
	# download
	git svn clone -r $(GRUBUTILS_REV) --preserve-empty-dirs "$(GRUBUTILS_SVN)"
	# patch
	for file in patches/*; do cat $$file | (cd $(GRUBUTILS_DIR) && git am -k); done
	mv $(GRUBUTILS_DIR) $@

install_linux: $(GRUBUTILS_DIR)_build
	make -C $</wee
	make -C $</weesetup
	# install
	mkdir -p doc
	cp $</wee/{README.txt,ChangeLog.txt} doc/
	mkdir -p bin
	cp $</wee/wee{63,127}.mbr bin/
	cp $</weesetup/bin/weesetup bin/

install_windows:
	wget -q -N $(WEESETUP_URL)/$(WEESETUP_PACKAGE) -O $(WEESETUP_PACKAGE)
	unzip -o -d bin $(WEESETUP_PACKAGE)

clean:
	# clean source
	rm -rf $(WEESETUP_PACKAGE) $(GRUBUTILS_DIR) $(GRUBUTILS_DIR)_build

distclean: clean
	# clean installed
	rm -rf bin doc
	
