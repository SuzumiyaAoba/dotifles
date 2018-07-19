#!/bin/sh

mkdir ~/.fonts

wget -O /var/tmp/Cica.zip https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip

unzip -f /var/tmp/Cica.zip -d ~/.fonts/Cica

sudo fc-cache -fv
