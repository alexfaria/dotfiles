#!/bin/bash

########## Variables
dir=~/.dotfiles                    # dotfiles directory

ln -s $dir/vimrc ~/.vimrc
ln -s $dir/vim ~/.vim
ln -s $dir/bash_aliases ~/.bash_aliases
ln -s $dir/tmux/tmux.conf ~/.tmux.conf
ln -s $dir/zsh/zshrc ~/.zshrc

echo "Make vim backup folder"
mkdir $dir/vim/.tmp
echo "Install vim plugins"
vim +PluginInstall +qall
