#!/bin/sh

case "$OSTYPE" in
    darwin*)
        brew install unzip fontconfig
esac

curl -L -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip -o /var/tmp/Cica.zip

case "$OSTYPE" in
    darwin*)
        brew install wget unzip fontconfig
        unzip -u /var/tmp/Cica.zip -d ~/Library/Fonts/Cica
        ;;
    linux*)
        mkdir ~/.fonts
        unzip -u /var/tmp/Cica.zip -d ~/.fonts/Cica
        ;;
esac

sudo fc-cache -fv
