#!/bin/bash
set -ex

echo "[INFO] Starting Dlib Install.."
sudo apt install libopenblas-dev pkg-config
pip install numpy
pip install scipy
pip install scikit-image
pip install dlib