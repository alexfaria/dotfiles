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

echo "Install cool fonts"
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

echo "Generating promptline"
vim +"PromptlineSnapshot! ~/.dotfiles/zsh/custom/promptline.zsh-theme airline" +qall
echo "Install vim plugins"
vim +PluginInstall +qall
echo "Reload zshrc"
source ~/.zshrc
