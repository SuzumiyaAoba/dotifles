#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

mkdir -p ~/go/bin

__info "━━…━━…━━…━━…━━…━━ Install go packages ━━…━━…━━…━━…━━…━━"

# 区切り文字を改行に
OLDIFS=$IFS
IFS=$'
'

packages=(`__lines ${BASH_SOURCE%/*}/go`)

n=${#packages[@]}

ith=1
for package in "${packages[@]}"; do

    __exec go get $package &
    __spin "($ith/$n)" "go get ${package}"

    if [ "$?" = "0" ]; then
        __success "($ith/$n)" "go get ${package}"
    else
        __fail "($ith/$n)" "go get ${package}"
    fi

    let ith++
done

# 区切り文字を戻す
IFS=$OLDIFS

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
