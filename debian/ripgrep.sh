#!/bin/bash

source "${BASH_SOURCE%/*}/../version.sh"
source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install ripgrep ━━…━━…━━…━━…━━…━━"

__require_sudo

__info "Download ripgrep"

curl -o /tmp/ripgrep.deb -LO "https://github.com/BurntSushi/ripgrep/releases/download/"$RIPGREP_VERSION"/ripgrep_"$RIPGREP_VERSION"_amd64.deb" --progress-bar

__exec sudo dpkg -i /tmp/ripgrep.deb &
__spin "\b" "Installing ripgrep"

if [ "$?" != "0" ]; then
    __fail "" "Fail to install ripgrep"
    exit 1
fi

__success "Complete to install ripgrep"

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━━…━━…━━…━━…━━…━━…━━…━━…━━"

