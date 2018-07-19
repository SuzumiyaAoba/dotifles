#!/bin/bash

. ./util.sh

dotfiles=`ls -1d .[^.]* | grep -v "\.swp$"`

ignores='
.config
.git
.gitmodules
'

dotfiles=(`(echo -n "${dotfiles[@]}" "${ignores[@]}" | sort -u; echo -n "${ignores[@]}") | sort | uniq -u`)

sfrm () {
    if [ -L $1 ]; then
        unlink $1
    else
        rm -rf $1
    fi
}

dotfiles=(${dotfiles[@]} `find .config -type f`)

for e in ${dotfiles[@]}; do
    sfrm ~/$e
    info "link: `pwd`/${e} -> ~/${e}"
    ln -s `pwd`/$e ~/$e
done
