#!/bin/bash


rm /var/cache/yum/* -rf
rm /var/cache/yum/.* -rf
rm /var/lib/yum/yumdb/* -rf
rm /var/lib/yum/history/* -rf
rm /root/.rpmdb -rf

# set up yum.repo
repo="[base]\n
name=EulerOS-2.0SP3 base\n
baseurl=http://developer.huawei.com/ict/site-euleros/euleros/repo/yum/$OS_VERSION/os/$machine/\n
enabled=1\n
gpgcheck=1\n
gpgkey=http://developer.huawei.com/ict/site-euleros/euleros/repo/yum/$OS_VERSION/os/RPM-GPG-KEY-EulerOS" 

echo -e $repo > /etc/yum.repos.d/euleros.repo

cd /usr/share/locale 
shopt -s extglob
rm -rf  !(zh_CN | en_US)
localedef --list-archive | grep -v -i ^en_US.utf8 | xargs localedef --delete-from-archive

mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl

build-locale-archive

truncate -s 0 /usr/lib/locale/locale-archive.tmpl

echo "clean in container success"
