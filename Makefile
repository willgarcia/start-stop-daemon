BASE := start-stop-daemon
NAME := $(BASE)
VERSION := $(shell grep Version: $(NAME).spec | tr -s " "| cut -d " " -f 2)
PKG_SOURCE := http://http.debian.net/debian/pool/main/d/dpkg/dpkg_$(VERSION).tar.xz

default:
	yum-builddep -y -t start-stop-daemon.spec
	rpmbuild -ba \
		--define "_topdir $(PWD)/dist" \
		--define "buildroot $(PWD)/dist/BUILDROOT" \
		--clean \
		$(NAME).spec

clean:
	rm -rf dpkg* dist

install: clean
	wget $(PKG_SOURCE)
	tar -xf dpkg_$(VERSION).tar.xz
	tar -czf dpkg_$(VERSION).tar.gz dpkg-$(VERSION)/
	mkdir -p dist/{BUILD,RPMS,SPECS,SOURCES,SRPMS,install}
	mv dpkg_$(VERSION).tar.gz dist/SOURCES


.PHONY: install clean default
