ARCH="$1"
OS_VERSION=$2

echo $1 $2 $ARCH $OS_VERSION
if [ -z $RPM_ROOT ]; then
	rm -rf $ARCH
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

# if [ "x$USER" != "xroot" ]; then
# 	echo "please run as root"
# 	exit
# fi

if [ -e $RPM_ROOT ];then
	# echo "rootfs exist, remove it"
	rm -rf $RPM_ROOT
fi


mkdir -p ${RPM_ROOT}

# init rpmdb
rpm --root ${RPM_ROOT} --initdb

# init yum repo
mkdir -p ${RPM_ROOT}/etc/yum.repos.d
euleros_repo=${RPM_ROOT}/etc/yum.repos.d/euleros.repo
echo "[base]" > ${euleros_repo}
echo name=EulerOS base >> ${euleros_repo}
echo baseurl=https://mirrors.huaweicloud.com/euler/$OS_VERSION/os/${ARCH}/ >> ${euleros_repo}
echo "enabled=1" >> ${euleros_repo}

curl https://mirrors.huaweicloud.com/euler/$OS_VERSION/os/RPM-GPG-KEY-EulerOS --output RPM-GPG-KEY-EulerOS
# install rpm key

rpm --root ${RPM_ROOT} --import RPM-GPG-KEY-EulerOS

# install package

echo "install package.."

yum -y --installroot=${RPM_ROOT} install yum

yum -y --installroot=${RPM_ROOT} clean all

cp ./clean_in_chroot.sh  ${RPM_ROOT}
# clean up
chroot $RPM_ROOT /clean_in_chroot.sh $ARCH $OS_VERSION
echo "return: $?"
#if [  $? -ne 0 ]; then 
#	echo "chroot failed"
#	echo 
#
#fi

rm  ${RPM_ROOT}/clean_in_chroot.sh

echo "generate packages"
rm -rf $ARCH
mkdir $ARCH
echo "generate $ARCH/EulerOS-$OS_VERSION-${ARCH}.tar.xz"
tar -C $RPM_ROOT -cJf  $ARCH/EulerOS-$OS_VERSION-${ARCH}.tar.xz .

echo "generate $ARCH/EulerOS-$OS_VERSION-${ARCH}-tar-xz.sha256"

sha256sum $ARCH/EulerOS-$OS_VERSION-${ARCH}.tar.xz  > $ARCH/EulerOS-$OS_VERSION-${ARCH}-tar-xz.sha256

rm -rf rootfs