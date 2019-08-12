#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install nvm ━━…━━…━━…━━…━━…━━"

# nvm インストールスクリプトのダウンロード
TMP_DIR=/var/tmp
export NVM_DIR=""
__info "Donwload script for install nvm to ${TMP_DIR}/nvm_install.sh"
curl -L https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh -o "${TMP_DIR}/nvm_install.sh" --progress-bar

__info "Execute ${TMP_DIR}/nvm_install.sh"

# スクリプトの実行
__exec bash "${TMP_DIR}/nvm_install.sh" &
__spin "\b" "Installing nvm"

if [ "$?" = "0" ]; then
    __success "" "Complete to install nvm"
else
    __fail "" "Fail to install nvm"
fi

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
