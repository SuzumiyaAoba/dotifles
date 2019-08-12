#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install packages ━━…━━…━━…━━…━━…━━"

# ルート権限で実行しているか確認
__require_sudo

# package lists の更新
__exec apt-get update &
__spin "\b" "Updating package lists"

if [ "$?" = "0" ]; then
    __success "" "Update package lists"
else
    __fail "" "Fail to update package lists"
fi

packages=(`__lines ${BASH_SOURCE%/*}/install`)

n=${#packages[@]}

ith=1
for package in "${packages[@]}"; do
    # パッケージアップデート
    __exec apt-get install -y $package &
    __spin "($ith/$n)" "Installing ${package}"

    if [ "$?" = "0" ]; then
        __success "($ith/$n)" "Install ${package}"
    else
        __fail "($ith/$n)" "Fail to install ${package}"
    fi

    let ith++
done

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
