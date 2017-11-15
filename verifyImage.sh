#!/bin/bash

officialRepo=github.com/docker-library/official-images
testscript=$PWD/official-images/test/run.sh
echo "start to get test script from: " $officialRepo
git clone  https://$officialRepo.git

if [ ! -f $testscript ]; then
	echo "fail to get test script"
	exit 1
fi

verifyImage(){
	local dDir="$1"
	cd $dDir
	if [ -f Dockerfile ]; then
		echo "start to verify: " $dDir	
		tag="eulerostest:"$dDir
		docker build -t $tag .
		$testscript $tag
		docker rmi -f $tag
	fi
	cd ..
}

for file in ./* ; do
	if [ -d $file ]; then
		verifyImage "$(basename "$file")"
	fi
done
