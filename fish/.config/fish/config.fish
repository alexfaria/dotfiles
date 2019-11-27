# bootstrap fisher

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# git aliases from oh-my-zsh
# https://gist.github.com/nafg/7521698

source ~/.config/fish/git.fish

# aliases

alias l ls
alias ll 'ls -la'
alias ls 'ls -FG'

# fish greeting

function fish_greeting
   date | lolcat
end
funcsave fish_greeting

# path
set -gx PATH $PATH ~/.local/bin

# source conda
if test -f /opt/anaconda/etc/fish/conf.d/conda.fish
    source /opt/anaconda/etc/fish/conf.d/conda.fish
end