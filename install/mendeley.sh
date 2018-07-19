#!/bin/sh

wget -O /var/tmp/mendeley.deb https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest

sudo dpkg -i /var/tmp/mendeley.deb
sudo apt --fix-broken install
