# Path to your oh-my-zsh installation.  export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
export EDITOR="vim"
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$DOTFILES/zsh/custom
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(sudo git extract archlinux zsh-syntax-highlighting npm autojump zsh-autosuggestions history-substring-search zsh-completions)

# User configuration

export PATH="$HOME/.local/bin/:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# global npm packages without root
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# GOPATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# dont write .pyc files
export PYTHONDONTWRITEBYTECODE=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias :q="exit"
alias dot="cd $DOTFILES"

alias tmux="tmux -2"
alias zshrc="vim $HOME/.zshrc"
alias vimrc="vim $HOME/.vimrc"
alias nvimrc="nvim $HOME/.config/nvim/init.vim"
alias tmuxrc="vim $HOME/.tmux.conf"
alias i3rc="vim $HOME/.config/i3/config $HOME/.config/i3blocks/config $HOME/.config/polybar/config"
alias venvrc="vim $VIRTUAL_ENV/bin/postactivate"
alias pacexpac="expac -H M \"%011m\t%-20n\t%10d\" \$(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort)) | sort -n"
alias relpav="pacmd unload-module module-udev-detect && pacmd load-module module-udev-detect; pulseaudio -k; sleep 1; pulseaudio --start"

alias sv="source $HOME/.zshrc"
[[ -f /opt/anaconda/etc/profile.d/conda.sh ]] && source /opt/anaconda/etc/profile.d/conda.sh
# [[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
