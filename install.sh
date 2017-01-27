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
[ -d .config/nvim ] && mv .config/nvim tmp
[ -d .config/i3 ] && mv .config/i3 tmp
[ -a .eslintrc.json ] && mv .eslintrc.json tmp/
[ -a .Xresources ] && mv .Xresources tmp/
[ -a .yaourtrc ] && mv .yaourtrc tmp/
[ -a .i3blocks.conf ] && mv .i3blocks.conf tmp/
[ -a .config/libinput-gestures.conf ] && mv .config/libinput-gestures.conf tmp
ln -s $dir/vimrc .vimrc
ln -s $dir/vim .vim
ln -s $dir/bash_aliases .bash_aliases
ln -s $dir/tmux/tmux.conf .tmux.conf
ln -s $dir/zsh/zshrc .zshrc
ln -s $dir/nvim .config/nvim
ln -s $dir/i3 .config/i3
ln -s $dir/eslintrc.json .eslintrc.json
ln -s $dir/Xresources .Xresources
ln -s $dir/yaourtrc .yaourtrc
ln -s $dir/libinput-gestures.conf .config/libinput-gestures.conf
# ln -s $dir/i3blocks.conf .i3blocks.conf

if [ "$1" == "all" ]; then
    echo "Install cool fonts"
    curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
    echo "Install vim plugins"
    vim +PluginInstall +qall
fi
nvim +PlugInstall
echo "Generate promptline"
vim +"Tmuxline" +"PromptlineSnapshot! $dir/zsh/custom/promptline.zsh-theme airline" +qall
echo "Generate tmuxline"
vim +"TmuxLineSnapshot! $dir/tmux/tmuxline.conf airline" +qall
