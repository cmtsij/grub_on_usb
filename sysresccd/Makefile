all: usage

usage:
	@echo "Usage:"
	@echo "    make install                # download and install systemrescuecd iso"
	@echo "    make generate_backstore     # generate backstore.bs for systemrescuecd"

install:
	sh upgrade_iso.sh
	sh extract.sh

generate_backstore:
	#need implement

clean:
	rm -f systemrescuecd.iso.new

distclean:
	rm -rf systemrescuecd.iso version backstore.bs
