#!/bin/bash

case "$OSTYPE" in
    darwin*)
        brew install unzip fontconfig
esac

TMP_DIR=/var/tmp

curl https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_with_emoji.zip -o "${TMP_DIR}/Cica.zip"

case "$OSTYPE" in
    darwin*)
        INSTALL_DIR=~/Library/Fonts/Cica ;;
    linux*)
        INSTALL_DIR=~/.fonts/Cica ;;
esac

unzip -u "${TMP_DIR}/Cica.zip" -d "$INSTALL_DIR"
sudo fc-cache -fv
