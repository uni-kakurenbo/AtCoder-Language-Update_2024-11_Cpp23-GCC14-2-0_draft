#!/bin/bash
set -eu

### GCC
sudo apt-get install -y "g++-14=${VERSION}"

### Libraries
sudo apt-get install -y git cmake pigz pbzip2

# Or-tools installer must be called later than Abseil and LibTorch installers
# because or-tools depends on abseil and protobuf which built by LibTorch.

# Eigen is build Libtorch

./sub-installers/abseil.sh
./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./sub-installers/GMP.sh
./sub-installers/libtorch.sh
./sub-installers/or-tools.sh
./sub-installers/LightGBM.sh
./sub-installers/range-v3.sh
./sub-installers/unordered_dense.sh
./sub-installers/Z3.sh

sudo apt-get remove -y --auto-remove git cmake pigz pbzip2
