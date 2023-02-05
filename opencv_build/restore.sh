#!/bin/bash
set -ex

echo "[INFO] Restoring system parameters.."
~/severinopi/opencv_build/swapfile.sh 100
sudo raspi-config nonint do_boot_behaviour B4
sudo raspi-config nonint do_memory_split 128

echo "[INFO] DONE! rebooting to desktop interface.."
sudo reboot