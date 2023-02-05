#!/bin/bash
set -ex

echo "[INFO] Clean space and Install Dependencies.."
~/severinopi/opencv_build/install-deps.sh

echo "[INFO] Preparing OpenCV Install.."
cd ~/severinopi/opencv_build

OPENCV_VERSION=4.5.5

if [ ! -z "$1" ]
then
  OPENCV_VERSION=$1
fi

~/severinopi/opencv_build/download.sh $OPENCV_VERSION
~/severinopi/opencv_build/build.sh $OPENCV_VERSION

echo "[INFO] Update system database"
cd ~/opencv/opencv-$OPENCV_VERSION/build
sudo make install
sudo ldconfig
sudo apt update

echo "[INFO] Remove temporary OpenCV folder"
sudo rm -rf ~/opencv

echo "[INFO] Getting python project path.."
PROJECT_PATH=~/severinopi

cd $PROJECT_PATH

~/severinopi/opencv_build/dlib.sh
~/severinopi/opencv_build/restore.sh