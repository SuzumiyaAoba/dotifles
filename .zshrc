source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug "junegunn/fzf-bin", \
	from:gh-r, \
	as:command, \
	rename-to:fzf, \
	use:"*darwin*amd64*"
zplug "SuzumiyaAoba/e8ecef67a5abb3a5defaa79d177986c7", \
	from:gist

zplug "mollifier/cd-gitroot"

zplug "b4b4r07/emoji-cli"
export EMOJI_CLI_FILTER="fzf --reverse"

zplug "chrissicool/zsh-256color"

zplug "knu/z", \
	use:z.sh

zplug "plugins/git", from:oh-my-zsh

# Prezto framework
zplug "sorin-ionescu/prezto", \
   use:"init.zsh", \
   hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto"

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'utility' \
  'completion' \
  'prompt' \
  'python' \
  'fasd' \
  'tmux'

zstyle ':prezto:module:prompt' theme 'pure'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
    echo
fi

zplug load

#######################################

export LANG=ja_JP.UTF-8

autoload -Uz colors
colors

bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#######################################

autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
	/usr/sbin /usr/bin /bin /usr/X11R6/bin

zstyle ':completion:*:process' command 'ps -x -o pid,s,args'

#######################################

setopt print_eight_bit

setopt no_beep

setopt no_flow_control

setopt ignore_eof

setopt interactive_comments

setopt auto_cd

setopt auto_pushd

setopt pushd_ignore_dups

setopt share_history

setopt hist_ignore_all_dups

setopt hist_ignore_space

setopt hist_reduce_blanks

setopt extended_glob

#######################################
#              alias                  #
#######################################

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias sudo='sudo '

#######################################
#                fzf                  #
#######################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--extended --cycle"

