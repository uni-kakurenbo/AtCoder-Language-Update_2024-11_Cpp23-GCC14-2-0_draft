# shellcheck disable=all

set -eu

CONFIG_PATHS=(
    "${PWD}/src/config/"
    "${PWD}/src/config/internal/"
    "${PWD}/src/config/library/"

    "/opt/abseil/lib/pkgconfig/"
    "/opt/or-tools/lib/pkgconfig/"
    "/opt/z3/lib/pkgconfig/"
)

CONFIG_PATHS="${CONFIG_PATHS[@]}"
CONFIG_PATHS="${CONFIG_PATHS// /:}"

PKG_CONFIG_PATH="${CONFIG_PATHS}"
export PKG_CONFIG_PATH

function gen-flags() {
    local flags
    local libs

    flags=($(pkg-config --cflags "$@" | tr ' ' '\n' | sort -u))
    libs=($(pkg-config --libs "$@"))

    echo "${flags[@]} ${libs[@]}"
}

gen-flags ac_internal | tr ' ' '\n' >./dist/internal.flags.txt
gen-flags ac_user | tr ' ' '\n' >./dist/user.flags.txt
