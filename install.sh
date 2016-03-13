#!/bin/bash

########## Variables
dir=~/.dotfiles                    # dotfiles directory
cd $dir
git submodule update --init --recursive

cd $HOME
ln -s $dir/vimrc .vimrc
ln -s $dir/vim .vim
ln -s $dir/bash_aliases .bash_aliases
ln -s $dir/tmux/tmux.conf .tmux.conf
ln -s $dir/zsh/zshrc .zshrc

echo "Make vim backup folder"
mkdir $dir/vim/.tmp

echo "Install patched fonts"
cd $dir
git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
chmod +x install.sh
sh ./install.sh
cd $dir
rm -rf powerline-fonts

echo "Install vim plugins"
vim +PluginInstall +qall
