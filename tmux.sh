#!/bin/sh

tmux source ~/.tmux.conf

git clone git@github.com:arcticicestudio/nord-terminator.git /var/tmp/nord-terminator
cd /var/tmp/nord-terminator && ./install.sh
