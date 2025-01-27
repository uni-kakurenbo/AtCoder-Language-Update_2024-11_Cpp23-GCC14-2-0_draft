#!/bin/bash
set -eu

sudo apt-get install -y "libeigen3-dev=${VERSION}"

sudo mkdir -p /opt/ac_install/eigen3/include/

sudo cp -Trf /usr/include/eigen3/ /opt/ac_install/eigen3/include/
sudo rm -rf /usr/include/eigen3/
