#!/bin/bash
set -eu

sudo apt-get install -y "libeigen3-dev=${VERSION}"

sudo mkdir -p /opt/ac_install/eigen3/include/Eigen/
sudo mkdir -p /opt/ac_install/eigen3/include/unsupported/Eigen/CXX11

find /usr/include/eigen3/Eigen/ -maxdepth 1 -type f -exec bash -c 'sudo cp "$1" /opt/ac_install/eigen3/include/Eigen/' -- {} \;
find /usr/include/eigen3/unsupported/Eigen/ -maxdepth 1 -type f -exec bash -c 'sudo cp "$1" /opt/ac_install/eigen3/include/unsupported/Eigen/' -- {} \;
find /usr/include/eigen3/unsupported/Eigen/CXX11 -maxdepth 1 -type f -exec bash -c 'sudo cp "$1" /opt/ac_install/eigen3/include/unsupported/Eigen/CXX11/' -- {} \;
