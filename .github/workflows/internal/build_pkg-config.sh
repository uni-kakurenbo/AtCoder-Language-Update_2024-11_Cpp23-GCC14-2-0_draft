#!/bin/bash
set -eu

VERSION="0.29.2"

if [[ "$(pkg-config --version)" = "${VERSION}" ]]; then
    exit 0
fi

sudo mkdir -p ./tmp/ && cd ./tmp/

sudo wget https://pkg-config.freedesktop.org/releases/pkg-config-${VERSION}.tar.gz
tar xvf pkg-config-${VERSION}.tar.gz

cd ./pkg-config-${VERSION}

./configure --with-internal-glib

make
sudo make install

cd ../../
sudo rm -rf ./tmp/
