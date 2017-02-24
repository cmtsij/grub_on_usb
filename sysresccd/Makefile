all: usage

SYSTEMRESCUECD_ISO=../../boot-isos/systemrescuecd.iso

usage:
	@echo "Usage:"
	@echo "    make install                # download and install systemrescuecd iso"
	@echo "    make generate_backstore     # generate backstore.bs for systemrescuecd"

install:
	sh upgrade_iso.sh $(SYSTEMRESCUECD_ISO)
	sh extract.sh $(SYSTEMRESCUECD_ISO)

upgrade: install

generate_backstore:
	#need implement

clean:
	rm -f $(SYSTEMRESCUECD_ISO).new

distclean:
	make clean
	rm -rf $(SYSTEMRESCUECD_ISO) version backstore.bs
	rm -rf iso
