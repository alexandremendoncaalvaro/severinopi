#!/bin/bash
set -ex

OPENCV_VERSION=4.5.5

if [ ! -z "$1" ]
then
  OPENCV_VERSION=$1
fi

cd ~
mkdir -p opencv && pushd opencv

wget -O "opencv-${OPENCV_VERSION}.tar.gz" "https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz"
tar -xvf "opencv-${OPENCV_VERSION}.tar.gz"

popd