#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"


__info "━━…━━…━━…━━…━━…━━ Install fish ━━…━━…━━…━━…━━…━━"

__require_sudo

__exec sudo apt-add-repository -y ppa:fish-shell/release-3 &
__spin "\b" "Add repository ppa:fish-shell/release-3"

if [ "$?" != "0" ]; then
    __fail "" "Fail to add repository ppa:fish-shell/release-3"
    exit 1
fi

__success "" "Complete to add repository ppa:fish-shell/release-3"

__exec sudo apt install -y fish &
__spin "\b" "Installing fish"

if [ "$?" != "0" ]; then
    __fail "" "Fail to install fish"
    exit 1
fi

__success "" "Complete to install fish"

__info "━━…━━…━━…━━…━━…━━…━━…━━━…━━…━━…━━…━━…━━…━━…━━…━━"
