#!/bin/bash
dir=~/.dotfiles
export PATH="~/bin:$PATH"
export DOTFILES=$dir

cd $dir
git submodule update --init --recursive

cd $HOME
[ ! -d tmp ] && mkdir tmp/
[ ! -d $dir/vim/.tmp ] && mkdir $dir/vim/.tmp
[ ! -d .config ] && mkdir .config
[ -a .vimrc ] && mv .vimrc tmp/
[ -a .bash_aliases ] && mv .bash_aliases tmp/
[ -a .vim ] && mv .vim tmp/
[ -a .tmux.conf ] && mv .tmux.conf tmp/
[ -a .zshrc ] && mv .zshrc tmp/
[ -d .config/nvim ] && mv .config/nvim -r tmp
ln -s $dir/vimrc .vimrc
ln -s $dir/vim .vim
ln -s $dir/bash_aliases .bash_aliases
ln -s $dir/tmux/tmux.conf .tmux.conf
ln -s $dir/zsh/zshrc .zshrc
ln -s $dir/nvim .config/nvim

if [ "$1" == "all" ]; then
    echo "Install cool fonts"
    curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
fi
echo "Install vim plugins"
vim +PluginInstall +qall
echo "Generate promptline"
vim +"Tmuxline" +"PromptlineSnapshot! $dir/zsh/custom/promptline.zsh-theme airline" +qall
echo "Generate tmuxline"
vim +"TmuxLineSnapshot! $dir/tmux/tmuxline.conf airline" +qall
