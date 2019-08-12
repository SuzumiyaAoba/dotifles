#!/bin/bash

source "${BASH_SOURCE%/*}/../lib/libs.sh"

__info "━━…━━…━━…━━…━━…━━ Install Cica font ━━…━━…━━…━━…━━…━━"

# OS毎に必要なソフトウェアのインストール
case "$OSTYPE" in
    darwin*)
        brew install unzip fontconfig
esac

# Cica.zip をダウンロード
TMP_DIR=/var/tmp
__info "Download Cica to ${TMP_DIR}/Cica.zip"
curl -L https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_with_emoji.zip -o "${TMP_DIR}/Cica.zip" --progress-bar

if [ "$?" != "0" ]; then
    __fail "" "Fail to download Cica.zip"
    exit 1
fi
__success "" "Complete to download Cica.zip"

# OS毎にフォントのインストール先を指定
case "$OSTYPE" in
    darwin*)
        INSTALL_DIR=~/Library/Fonts/Cica
        ;;
    linux*)
        INSTALL_DIR=~/.fonts/Cica
        ;;
esac

__info "unzip ${TMP_DIR}/Cica.zip to ${INSTALL_DIR}"

# フォントの入った圧縮ファイルを解凍
unzip -quo "${TMP_DIR}/Cica.zip" -d "${INSTALL_DIR}"

__success "" "Complete to unzip Cica.zip"

if [ "$?" != "0" ]; then
    __fail "" "Fail to unzip ${TMP_DIR}/Cica.zip"
    exit 1
fi

# フォントキャッシュを更新
__exec fc-cache -fv &
__spin "\b" "Updating font cache"

if [ "$?" != "0" ]; then
    __fail "" "Fail to update font cache"
    exit 1
fi

__success "" "Update font cache"

__info "━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━…━━"
