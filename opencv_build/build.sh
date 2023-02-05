#!/bin/bash
set -ex

OPENCV_VERSION=4.5.5
if [ ! -z "$1" ]
then
  OPENCV_VERSION=$1
fi

pushd ~/opencv/opencv-$OPENCV_VERSION
mkdir -p build
pushd build

RPI_VERSION=$(awk '{print $3}' < /proc/device-tree/model)
if [[ $RPI_VERSION -ge 3 ]]; then
  NUM_JOBS=$(nproc)
else
  NUM_JOBS=1 # Earlier versions of the Pi don't have sufficient RAM to support compiling with multiple jobs.
fi

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D ENABLE_NEON=ON \
      -D ENABLE_VFPV3=ON \
      -D BUILD_ZLIB=ON \
      -D BUILD_OPENMP=ON \
      -D BUILD_TIFF=OFF \
      -D BUILD_OPENJPEG=OFF \
      -D BUILD_JASPER=OFF \
      -D BUILD_OPENEXR=OFF \
      -D BUILD_WEBP=OFF \
      -D BUILD_TBB=ON \
      -D BUILD_IPP_IW=OFF \
      -D BUILD_ITT=OFF \
      -D WITH_OPENMP=ON \
      -D WITH_OPENCL=OFF \
      -D WITH_AVFOUNDATION=OFF \
      -D WITH_CAP_IOS=OFF \
      -D WITH_CAROTENE=OFF \
      -D WITH_CPUFEATURES=OFF \
      -D WITH_EIGEN=OFF \
      -D WITH_GSTREAMER=ON \
      -D WITH_GTK=ON \
      -D WITH_IPP=OFF \
      -D WITH_HALIDE=OFF \
      -D WITH_VULKAN=OFF \
      -D WITH_INF_ENGINE=OFF \
      -D WITH_NGRAPH=OFF \
      -D WITH_JASPER=OFF \
      -D WITH_OPENJPEG=OFF \
      -D WITH_WEBP=OFF \
      -D WITH_OPENEXR=OFF \
      -D WITH_TIFF=OFF \
      -D WITH_OPENVX=OFF \
      -D WITH_GDCM=OFF \
      -D WITH_TBB=ON \
      -D WITH_HPX=OFF \
      -D WITH_EIGEN=OFF \
      -D WITH_V4L=ON \
      -D WITH_LIBV4L=ON \
      -D WITH_VTK=OFF \
      -D WITH_QT=OFF \
      -D BUILD_opencv_python3=ON \
      -D BUILD_opencv_java=OFF \
      -D BUILD_opencv_gapi=OFF \
      -D BUILD_opencv_objc=OFF \
      -D BUILD_opencv_js=OFF \
      -D BUILD_opencv_ts=OFF \
      -D BUILD_opencv_dnn=OFF \
      -D BUILD_opencv_calib3d=OFF \
      -D BUILD_opencv_objdetect=OFF \
      -D BUILD_opencv_stitching=OFF \
      -D BUILD_opencv_ml=OFF \
      -D BUILD_opencv_world=OFF \
      -D BUILD_EXAMPLES=OFF \
      -D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
      -D OPENCV_ENABLE_NONFREE=OFF \
      -D OPENCV_GENERATE_PKGCONFIG=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF ..

make -j "$NUM_JOBS"
popd; popd