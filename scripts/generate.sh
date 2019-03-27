machine=$(uname -m)

if [ -z $RPM_ROOT ]; then
	rm -rf $machine
	echo "please set PRM_ROOT"
	exit
fi

if [ "x$RPM_ROOT" != "x$(pwd)/rootfs" ]; then
	echo "should set PRM_ROOT to $(pwd)/rootfs"
	exit
fi
if [ -z "$OS_VERSION" ]; then
	echo "should set OS_VERSION"
	exit
fi

if [ -z $ISO_PATH ];then
	echo "please set ISO_PATH as iso mountpoint"
	exit
fi

if [ "x$USER" != "xroot" ]; then
	echo "please run as root"
	exit
fi

if [ -e $RPM_ROOT ];then
	echo "rootfs exist, remove it"
	rm -rf $RPM_ROOT
fi


mkdir -p ${RPM_ROOT}

# init rpmdb
rpm --root ${RPM_ROOT} --initdb

# init yum repo
mkdir -p ${RPM_ROOT}/etc/yum.repos.d
euleros_repo=${RPM_ROOT}/etc/yum.repos.d/euleros.repo
echo "[base]" > ${euleros_repo}
echo name=EulerOS-2.0SP3 base >> ${euleros_repo}
echo baseurl=file://${ISO_PATH} >> ${euleros_repo}
echo "enabled=1" >> ${euleros_repo}

# install rpm key

rpm --root ${RPM_ROOT} --import     $ISO_PATH/RPM-GPG-KEY-EulerOS

# install package

echo "install package.."

yum -y --installroot=${RPM_ROOT} install yum

yum -y --installroot=${RPM_ROOT} clean all

cp ./clean_in_chroot.sh  ${RPM_ROOT}
# clean up
chroot $RPM_ROOT /clean_in_chroot.sh
echo "return: $?"
#if [  $? -ne 0 ]; then 
#	echo "chroot failed"
#	echo 
#
#fi

rm  ${RPM_ROOT}/clean_in_chroot.sh

echo "generate packages"
rm -rf $machine
mkdir $machine
echo "generate $machine/EulerOS-$OS_VERSION-${machine}.tar.xz"
tar -C $RPM_ROOT -cJf  $machine/EulerOS-$OS_VERSION-${machine}.tar.xz .

echo "enerate $machine/EulerOS-$OS_VERSION-${machine}-tar-xz.sha256"

sha256sum $machine/EulerOS-$OS_VERSION-${machine}.tar.xz  > $machine/EulerOS-$OS_VERSION-${machine}-tar-xz.sha256

