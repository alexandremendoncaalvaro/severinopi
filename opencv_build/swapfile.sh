#!/bin/bash
set -ex

RPI_VERSION=$(awk '{print $3}' < /proc/device-tree/model)
if [[ $RPI_VERSION -le 3 ]]; then
  SWAPSIZE=2048

  if [ ! -z "$1" ]
  then
    SWAPSIZE=$1
  fi

  sudo dphys-swapfile swapoff
  sudo sed -i "s:CONF_SWAPSIZE=.*:CONF_SWAPSIZE=${SWAPSIZE}:g" /etc/dphys-swapfile
fi