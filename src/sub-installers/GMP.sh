#!/bin/bash
set -eu

echo "::endgruop::GMP"

sudo apt-get install -y "libgmp3-dev=${VERSION}"

echo "::endgruop::"
