#!/bin/bash
set -ex

echo "[INFO] Testing OpenCV: Loading a Color Image in Grayscale.."
test ! -f ~/severinopi/opencv_build/lenna.jpg && wget "https://upload.wikimedia.org/wikipedia/en/7/7d/Lenna_%28test_image%29.png" -O ~/severinopi/opencv_build/lenna.jpg
python ~/severinopi/opencv_build/test-opencv.py ~/severinopi/opencv_build/lenna.jpg

echo "[INFO] Testing Dlib: Getting detector model dataset.."
test ! -f ~/severinopi/opencv_build/shape_predictor_68_face_landmarks.dat && wget "http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2" -O ~/severinopi/opencv_build/shape_predictor_68_face_landmarks.dat.bz2 && bzip2 -d ~/severinopi/opencv_build/shape_predictor_68_face_landmarks.dat.bz2
sudo rm -f ~/severinopi/opencv_build/shape_predictor_68_face_landmarks.dat.bz2

echo "[INFO] Testing Dlib: Installing example dependencies.."
pip install imutils

echo "[INFO] Testing Dlib: determine facial landmarks.."
python ~/severinopi/opencv_build/test-dlib.py ~/severinopi/opencv_build/lenna.jpg ~/severinopi/opencv_build/shape_predictor_68_face_landmarks.dat