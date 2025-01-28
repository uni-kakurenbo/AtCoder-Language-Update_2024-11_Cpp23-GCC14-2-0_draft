#!/bin/bash
set -eu

WORKING_DIRECTORY="$(dirname "$0")"

sudo apt-get install -y dasel jq

"${WORKING_DIRECTORY}/tools/pkg-config.sh"
"${WORKING_DIRECTORY}/tools/taplo.sh"

rm -rf ./dist/ && mkdir -p ./dist/
