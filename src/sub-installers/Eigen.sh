#!/bin/bash
set -eu

sudo apt-get install -y "libeigen3-dev=${VERSION}"

sudo mkdir -p /opt/ac_install/eigen3/Eigen/
sudo mkdir -p /opt/ac_install/eigen3/unsupported/

sudo cp /usr/include/eigen3/Eigen/** /opt/ac_install/eigen3/Eigen/ 2>/dev/null
sudo cp /usr/include/eigen3/unsupported/** /opt/ac_install/eigen3/unsupported/ 2>/dev/null
