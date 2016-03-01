" Vundle {{{
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'groenewege/vim-less'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'AutoClose'
" Plugin 'klen/python-mode'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" }}}
" Settings {{{
syntax enable   " enable syntax highlighting
colorscheme Monokai
"colorscheme badwolf
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set number      " show line numbers
set showcmd     " show command in bottom bar
set wildmenu    " visual autocomplete for command menu
set ignorecase
set infercase
set ts=4        " set tabs to have 4 spaces
set softtabstop=4   " number of spaces in tab editing
set cursorline
set showmatch   " highlight matching [{()}]
set incsearch   " search as chars are entered
set hlsearch    " highlight matches
set autoindent  " indent when moving to the next line while writing code
set expandtab   " expand tabs into spaces
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" enable all Python syntax highlighting features
let python_highlight_all = 1
let g:indentLine_char = '·'
"let g:indentLine_char = '￤'
" }}}
"
" Bindings {{{
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]   " highlight last inserted text
inoremap jj <esc>   " go to normal mode

" inoremap {<CR> {<CR>}<Esc>ko
" inoremap { {}<Left>
" inoremap {} {}
" inoremap (  ()<Left>
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession!<CR>   " save session

nnoremap <leader>t :NERDTreeToggle<CR>
" }}}
