#!/bin/bash
set -ex

echo "[INFO] Testing PiCamera: Installing example dependencies.."
pip install picamera[array]

echo "[INFO] Testing PiCamera: Installing example dependencies.."
python ~/severinopi/opencv_build/test-picamera.py
