#!/bin/bash
[ ! -f /etc/os-release ] && echo "Not Found Version! " && exit 1;
[ -f /etc/os-release ] && DEB_VER="$(awk -F'[= "]' '/VERSION_ID/{print $3}' /etc/os-release)"
[ -z $DEB_VER ] && echo "Error, Found Version! " && exit 1;
[ "$DEB_VER" == '7' ] && CodeName="wheezy"
[ "$DEB_VER" == '8' ] && CodeName="jessie"
[ "$DEB_VER" == '9' ] && CodeName="stretch"
cp /etc/apt/sources.list.d/sources-aliyun-1.list /etc/apt/sources.list.d/sources-aliyun-1.list .$(date +"%Y%m%d%S")
cat >/etc/apt/sources.list.d/sources-aliyun-1.list  <<EOF
deb http://httpredir.debian.org/debian ${CodeName} main
deb-src http://httpredir.debian.org/debian ${CodeName} main
deb http://httpredir.debian.org/debian ${CodeName}-backports main
deb-src http://httpredir.debian.org/debian ${CodeName}-backports main
deb http://httpredir.debian.org/debian ${CodeName}-updates main
deb-src http://httpredir.debian.org/debian ${CodeName}-updates main
deb http://httpredir.debian.org/debian-security ${CodeName}/updates main non-free contrib
deb-src http://httpredir.debian.org/debian-security ${CodeName}/updates main non-free contrib
EOF
apt-get update