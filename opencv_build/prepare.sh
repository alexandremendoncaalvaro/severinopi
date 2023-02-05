#!/bin/bash
set -ex

cd ~/severinopi/opencv_build
sudo chmod +x ~/severinopi/opencv_build/*.sh

echo "[INFO] Optimizing system for installation.."
~/severinopi/opencv_build/swapfile.sh
sudo raspi-config --expand-rootfs
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint do_memory_split 16

echo "[INFO] DONE! rebooting to command line interface.."
sudo reboot