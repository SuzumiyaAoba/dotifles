#!/bin/bash

set -e

. ./util.sh

# OS毎に必要なソフトウェアのインストール
case "$OSTYPE" in
    darwin*)
        brew install unzip fontconfig
esac

TMP_DIR=/var/tmp

info "Download Cica to ${TMP_DIR}/Cica.zip"

curl -L https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_with_emoji.zip -o "${TMP_DIR}/Cica.zip" --progress-bar

info "Complete to download Cica.zip"

# OS毎にフォントのインストール先を指定
case "$OSTYPE" in
    darwin*)
        INSTALL_DIR=~/Library/Fonts/Cica ;;
    linux*)
        INSTALL_DIR=~/.fonts/Cica ;;
esac

info "unzip ${TMP_DIR}/Cica.zip to ${INSTALL_DIR}"

# フォントの入った圧縮ファイルを解凍
unzip -quo "${TMP_DIR}/Cica.zip" -d "${INSTALL_DIR}"

info "Complete to unzip Cica.zip"

info "Updating font cache"

password

result=0
output=$(echo "$password" | sudo -S fc-cache -fv 2>&1 > /dev/null) &
progress_indicator "Updating font cache"

if [ "$result" = "0" ]; then
    info "Complete to update font cache"
else
    error "Fail to update font cache"
    echo "$output"
fi
