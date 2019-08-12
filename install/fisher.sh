#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install fisher ━━…━━…━━…━━…━━…━━"

__info "Download fisher"

# fisher のダウンロード
if !(fish -c "type fisher > /dev/null 2>&1"); then
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher --progress-bar
else
    __exec fish -c "fisher self-update" &
    __spin "\b" "fisher self-update"

    if [ "$?" != "0" ]; then
        __fail "" "Fail to self-update fisher"
        exit 1
    fi
fi

__success "" "Complete to self-update fisher"

__info "Install fihser plugins"

packages=(`__lines fisher | xargs`)

n=${#packages[@]}

ith=1
for package in "${packages[@]}"; do
    __exec fish -c 'fisher add ${package}' &
    __spin "($ith/$n)" "Installing ${package}"

    if [ "$?" = "0" ]; then
        __success "($ith/$n)" "Install ${package}"
    else
        __fail "($ith/$n)" "Install ${package}"
    fi

    let ith++
done

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
