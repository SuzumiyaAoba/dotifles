set fish_greeting ""

set -U GOPATH $HOME/go
set -U fish_user_paths $fish_user_paths $GOPATH/bin

set -x LESSOPEN '| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
set -x LESS '-R'

set -x EDITOR "/usr/bin/vim"

set -U FZF_LEGACY_KEYBINDINGS 1

# OPAM configuration
source /home/tkhsh/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

