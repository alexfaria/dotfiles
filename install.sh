#!/bin/bash

dir=~/.dotfiles
cd $dir
git submodule update --init --recursive

cd $HOME
mkdir tmp/
mv .vimrc tmp/
mv .vim tmp/
mv .bash_aliases tmp/
mv .tmux.conf tmp/
mv .zshrc tmp/
ln -s $dir/vimrc .vimrc
ln -s $dir/vim .vim
ln -s $dir/bash_aliases .bash_aliases
ln -s $dir/tmux/tmux.conf .tmux.conf
ln -s $dir/zsh/zshrc .zshrc

echo "Make vim backup folder"
mkdir $dir/vim/.tmp
if [ "$1" == "fonts" ]; then
    echo "Install cool fonts"
    curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
fi
echo "Install vim plugins"
vim +PluginInstall +qall
echo "Generate promptline"
vim +"PromptlineSnapshot! $dir/zsh/custom/promptline.zsh-theme airline" +qall
echo "Generate tmuxline"
vim +"TmuxLineSnapshot! $dir/tmux/tmuxline.conf" +qall
echo "Reload zshrc"
source $dir/zsh/zshrc
