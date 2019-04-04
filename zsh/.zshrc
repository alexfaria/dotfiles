# Path to your oh-my-zsh installation.  export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
export EDITOR="nvim"
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$DOTFILES/zsh/custom
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git extract archlinux sudo zsh-syntax-highlighting docker docker-compose npm autojump)

# User configuration

export PATH="$HOME/.local/bin/:$HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

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

# if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
#   exec startx
# fi
