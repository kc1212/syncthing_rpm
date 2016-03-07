#!/usr/bin/env bash
set -e

name=syncthing
specname=$name.spec
os_release=`cat /etc/os-release | grep VERSION_ID | sed 's/VERSION_ID=//g'`
rpm_release=1 # ideally we want to code this

# remove syncthing stuff
rm -f ~/rpmbuild/SPECS/$name*
rm -f ~/rpmbuild/SOURCES/$name*
rm -f ~/rpmbuild/SOURCES/sha1sum.txt.asc
rm -fr ~/rpmbuild/BUILD/$name*

# download and build srpm
wget https://raw.githubusercontent.com/kc1212/syncthing_rpm/master/SPECS/$specname -P ~/rpmbuild/SPECS/
spectool -g -R ~/rpmbuild/SPECS/$specname
rpmbuild -ba ~/rpmbuild/SPECS/$specname

# send to copr, API key stored in ~/.config/copr
version=`cat ~/rpmbuild/SPECS/syncthing.spec | egrep ^Version: | sed 's/^Version://'`
copr build syncthing ~/rpmbuild/SRPMS/syncthing-$version-${rpm_release}.fc${os_release}.src.rpm
