#!/bin/bash
ARCH="$1"
OS_VERSION=$2

rm /var/cache/yum/* -rf
rm /var/cache/yum/.* -rf
rm /var/lib/yum/yumdb/* -rf
rm /var/lib/yum/history/* -rf
rm /root/.rpmdb -rf

# set up yum.repo
# https://mirrors.huaweicloud.com/euler/2.5/os/x86_64/
repo="[base]\nname=EulerOS base\nbaseurl=https://mirrors.huaweicloud.com/euler/$OS_VERSION/os/${ARCH}/\nenabled=1\ngpgcheck=1\ngpgkey=https://mirrors.huaweicloud.com/euler/$OS_VERSION/os/RPM-GPG-KEY-EulerOS"

echo -e $repo > /etc/yum.repos.d/euleros.repo

cd /usr/share/locale 
shopt -s extglob
rm -rf  !(zh_CN | en_US)
localedef --list-archive | grep -v -i ^en_US.utf8 | xargs localedef --delete-from-archive

mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl

build-locale-archive

truncate -s 0 /usr/lib/locale/locale-archive.tmpl

echo "clean in container success"
