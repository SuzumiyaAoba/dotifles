set fish_greeting ""

set -x fish_user_paths $fish_user_paths $HOME/bin

set -x GOPATH $HOME/go
set -x fish_user_paths $fish_user_paths $GOPATH/bin
set -x fish_user_paths $fish_user_paths /usr/local/go/bin

set -x FZF_LEGACY_KEYBINDINGS 1

set -x fish_user_paths $fish_user_paths $HOME/.cask/bin

# nvm
set -x NVM_DIR $HOME/.nvm
eval (sh $NVM_DIR/nvm.sh)

switch (uname)
    case Linux
            alias open 'xdg-open'
end

# OPAM configuration
source /home/(whoami)/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

function fish_title
    true
end
