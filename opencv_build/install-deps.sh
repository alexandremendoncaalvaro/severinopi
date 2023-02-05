#!/bin/bash
set -ex

echo "[INFO] Removing Wolfram Engine and LibreOffice to reclaim space"
sudo apt purge -y wolfram-engine
sudo apt purge -y libreoffice*
sudo apt clean
sudo apt autoremove -y

echo "[INFO] Update and upgrade any existing packages"
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

echo "[INFO] Install general tools"
sudo apt install -y build-essential cmake unzip git pkg-config

echo "[INFO] Install image I/O packages"
sudo apt install -y libjpeg-dev libpng-dev

echo "[INFO] Install video I/O packages"
sudo apt install -y libavcodec-dev libavformat-dev
sudo apt install -y libswscale-dev libdc1394-22-dev

echo "[INFO] Install video Back engine"
sudo apt install -y libv4l-dev v4l-utils

echo "[INFO] Install the highgui GTK development library and prerequisites. Used to display images to our screen and build basic GUIs"
sudo apt install -y libgtk2.0-dev libcanberra-gtk* libgtk-3-dev

echo "[INFO] Install Matrix operations optimizers"
sudo apt install -y libatlas-base-dev gfortran

echo "[INFO] Install parallel framework"
sudo apt install -y libtbb2 libtbb-dev

echo "[INFO] Install dlib prerequisites"
sudo apt install -y libboost-all-dev

echo "[INFO] Install Python 3 header files so we can compile OpenCV with Python bindings"
sudo apt install -y python3-dev python3-numpy

echo "[INFO] Update Pip"
sudo pip3 install -U pip