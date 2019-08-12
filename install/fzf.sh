#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install fzf ━━…━━…━━…━━…━━…━━"

FZF_REPO="junegunn/fzf"

if [ -e ~/.fzf ]; then
    __info "~/.fzf already exists"
    __info "Remove ~/.fzf"
    rm -rf ~/.fzf
fi

__exec git clone --depth 1 "https://github.com/"$FZF_REPO".git" ~/.fzf &
__spin "\b" "Cloning $FZF_REPO"

if [ "$?" != "0" ]; then
    __fail "" "Fail to clone $FZF_REPO"
    exit 1
fi

__success "Complete to clone $FZF_REPO"

__exec ~/.fzf/install --key-bindings --completion --update-rc &
__spin "\b" "Installing fzf"

if [ "$?" != "0" ]; then
    __fail "" "Fail to install fzf"
    exit 1
fi

__success "" "Complete to install fzf"

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
