#!/bin/bash

ARCH=$(uname -m)
OS_VERSION=2.5

for i in "$@"; do
  case $i in
    -a=*|--arch=*)
      ARCH="${i#*=}"
      shift
      ;;
    -o=*|--os-version=*)
      OS_VERSION="${i#*=}"
      shift
      ;;
    *)
      ;;
  esac
done
cd scripts

id=`docker run -it -d --rm \
    -v $PWD:/euleros \
    -w /euleros \
    -v /var/run/docker.sock:/var/run/docker.sock \
    centos:8 bash`

docker exec -t \
  -e RPM_ROOT="/euleros/rootfs" \
  $id /bin/bash -c "bash generate.sh $ARCH $OS_VERSION"

docker kill $id

cd ..
docker build -f Dockerfile --build-arg ARCH=$ARCH --build-arg OS_VERSION=$OS_VERSION . 
