#!/bin/bash

. ./util.sh

dotfiles=`ls -1d .[^.]* | grep -v "\.swp$"`

ignores='
.config
.git
.gitmodules
'

dotfiles=(`(echo -n "${dotfiles[@]}" "${ignores[@]}" | sort -u; echo -n "${ignores[@]}") | sort | uniq -u`)

dotfiles=(${dotfiles[@]} `find .config -type f`)

for e in ${dotfiles[@]}; do
    sfrm ~/$e
    info "link: `pwd`/${e} -> ~/${e}"
    ln -s `pwd`/$e ~/$e
done
