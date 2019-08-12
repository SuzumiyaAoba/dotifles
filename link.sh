#!/bin/bash


source "${BASH_SOURCE%/*}/lib/libs.sh"

dotfiles=`ls -1d .[^.]* | grep -v "\.swp$"`

ignores='
.config
.git
.gitmodules
'

dotfiles=(`(echo -n "${dotfiles[@]}" "${ignores[@]}" | sort -u; echo -n "${ignores[@]}") | sort | uniq -u`)

dotfiles=(${dotfiles[@]} `find .config -type f`)

__info "Link dotfiles"

for e in ${dotfiles[@]}; do
    __sfrm ~/$e
    __info "link: `pwd`/${e} -> ~/${e}"
    ln -s `pwd`/$e ~/$e
done

__success "" "Complete to link dotfiles"
