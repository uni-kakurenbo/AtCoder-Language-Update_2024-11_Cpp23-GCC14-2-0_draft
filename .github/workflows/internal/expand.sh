#!/bin/bash
set -eu

DIR="$(dirname "$0")"

"${DIR}/functions/build_pkg-config.sh"

rm -rf ./dist/ && sudo mkdir -p ./dist/

source "${DIR}/functions/flag-generator.sh"

gen-flags ac_internal | tr ' ' '\n' >./dist/internal.flags.txt
cat ./dist/internal.flags.txt

"${DIR}/replacers/sub-installers.sh"
"${DIR}/replacers/installer.sh"

chmod +x "./dist/install.sh" && ./dist/install.sh

gen-flags ac_user | tr ' ' '\n' >./dist/user.flags.txt
cat ./dist/user.flags.txt

"${DIR}/replacers/builder.sh"
"${DIR}/replacers/config.sh"
