#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install Mendeley ━━…━━…━━…━━…━━…━━"

__require_sudo

# mendeley.deb をダウンロード
TMP_DIR=/var/tmp
__info "Download mendeley to ${TMP_DIR}/mendeley.deb"
curl -L https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest -o "${TMP_DIR}/mendeley.deb" --progress-bar

__success "" "Complete to download mendeley.deb"

# Mendeley をインストール
__exec sudo dpkg -i "${TMP_DIR}/mendeley.deb" &
__spin "\b" "Installing Mendeley"

if [ "$?" != "0" ]; then
    __fail "" "Fail to install Mendeley"
fi

__success "" "Install Mendeley"


__info "━━…━━…━━…━━…━━…━━…━━…━━…━━━━…━━…━━…━━…━━…━━…━━…━━…━━"
