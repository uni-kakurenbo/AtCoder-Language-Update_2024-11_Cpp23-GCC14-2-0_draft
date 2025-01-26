#!/bin/bash
set -eu

DIR="$(dirname "$0")"

"${DIR}/build_pkg-config.sh"

"${DIR}/gen-flags.sh"

rm -rf ./dist/
mkdir -p ./dist/

"${DIR}/replacers/sub-installers.sh"
"${DIR}/replacers/installer.sh"
"${DIR}/replacers/builder.sh"
"${DIR}/replacers/config.sh"
