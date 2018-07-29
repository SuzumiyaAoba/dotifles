#!/bin/sh

curl -o /tmp/ripgrep.deb -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i /tmp/ripgrep.deb
sudo apt --fix-broken install
