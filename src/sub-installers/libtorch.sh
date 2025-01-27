#!/bin/bash
set -eu

cd /tmp/ac_install/

sudo wget -q "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-${VERSION}%2Bcpu.zip" -O ./libtorch.zip
sudo unzip -oq ./libtorch.zip -d ./

sudo mkdir -p /opt/libtorch/include/
sudo mkdir -p /opt/libtorch/lib/

sudo rm -f ./libtorch/lib/libprotobuf.a
sudo rm -f ./libtorch/lib/libprotobuf-lite.a
sudo rm -f ./libtorch/lib/libprotoc.a

sudo cp -Trf ./libtorch/include/ /opt/libtorch/include/
sudo cp -Trf ./libtorch/lib/ /opt/libtorch/lib/
