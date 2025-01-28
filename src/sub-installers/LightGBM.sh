#!/bin/bash
set -eu

cd /tmp/ac_install/

echo "::gruop::LightGBM"

sudo mkdir -p ./light-gbm/

sudo wget -q "https://github.com/microsoft/LightGBM/releases/download/v${VERSION}/lightgbm-${VERSION}.tar.gz" -O ./light-gbm.tar.gz
sudo tar -I pigz -xf ./light-gbm.tar.gz -C ./light-gbm/ --strip-components 1

cd ./light-gbm/

sudo rm -rf ./lightgbm/
sudo rm -rf ./external_libs/eigen/

sudo mkdir -p ./build/ && cd ./build/

sudo cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/ac_install/light-gbm/ \
    -DCMAKE_C_FLAGS:STRING="-w" \
    -DCMAKE_CXX_COMPILER:STRING="g++-14" \
    -DCMAKE_CXX_FLAGS:STRING="${BUILD_FLAGS[*]} -I/opt/ac_install/eigen3/include/" \
    -DCMAKE_INSTALL_MESSAGE:STRING=NEVER -DCMAKE_MESSAGE_LOG_LEVEL:STRING=WARNING \
    ../

sudo cmake --build ./ --target install --parallel "${PARALLEL}"

echo "::endgruop::"
