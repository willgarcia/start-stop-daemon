#!/bin/bash

set -o xtrace
set -o errexit
set -o pipefail

readonly NAME=start-stop-daemon
readonly VERSION=$(grep Version: "/root/build/$NAME.spec" | tr -s " "| cut -d " " -f 2)
readonly PKG_SOURCE="http://http.debian.net/debian/pool/main/d/dpkg/dpkg_$VERSION.tar.xz"

cd /root

wget $PKG_SOURCE
tar -xf dpkg_$VERSION.tar.xz
tar -czf dpkg_$VERSION.tar.gz dpkg-$VERSION/
mkdir -p dist/{BUILD,RPMS,SPECS,SOURCES,SRPMS,install}
mv dpkg_$VERSION.tar.gz dist/SOURCES
cp /root/build/start-stop-daemon.spec /root/

cd /root/build/

chown -R `stat -c "%u:%g" .` .
yum-builddep -y -t start-stop-daemon.spec
ls -al /root/

rpmbuild -ba \
    --define "_topdir /root/dist" \
    --define "buildroot /root/dist/BUILDROOT" \
    --clean \
    /root/start-stop-daemon.spec

cp /root/dist/RPMS/x86_64/* .
