#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install tmux utility ━━…━━…━━…━━…━━…━━"

# tpm をクローン
if [ -e ~/.tmux/plugins/tpm ]; then
    __info "~/.tmux/plugins/tpm already exists"
    __info "Remove ~/.tmux/plugins/tpm"
    rm -rf ~/.tmux/plugins/tpm
fi

__exec git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &
__spin "\b" "Cloning tpm"

if [ "$?" != "0" ]; then
    __fail "" "Fail to clone tpm"
    exit 1
fi

__success "" "Clone tpm"

if [ -e /var/tmp/nord-terminator ]; then
    rm -rf /var/tmp/nord-terminator
fi

# tmux のテーマをダウンロード
__exec git clone git@github.com:arcticicestudio/nord-terminator.git /var/tmp/nord-terminator &
__spin "\b" "Cloning nord-terminator"

if [ "$?" != "0" ]; then
    __fail "" "Fail to clone nord-terminator"
    exit 1
fi

__success "" "Clone nord-terminator"

# nord-terminator をインストール
cd /var/tmp/nord-terminator
__exec install.sh &
__spin "\b" "Installing nord-terminator"

if [ "$?" = "0" ]; then
    __success "" "Install nord-terminator"
else
    __fail "" "Fail to install nord-terminator"
fi

# tmux の設定ファイルの読み込み
tmux source ~/.tmux.conf

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
