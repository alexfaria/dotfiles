
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'groenewege/vim-less'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'gregsexton/MatchTag'    " matching html tag
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sickill/vim-monokai'

" Plugin 'scrooloose/nerdtree'
" Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()            " required
filetype plugin indent on    " required


syntax enable   " enable syntax highlighting
colorscheme monokai

set showcmd     " show command in bottom bar
set wildmenu    " visual autocomplete for command menu
set ignorecase
set infercase
set ts=2        " set tabs to have 4 spaces
set softtabstop=2   " number of spaces in tab editing
set cursorline
set showmatch   " highlight matching [{()}]
set incsearch   " search as chars are entered
set hlsearch    " highlight matches
set autoindent  " indent when moving to the next line while writing code
set expandtab   " expand tabs into spaces
set shiftwidth=2
set laststatus=2
let python_highlight_all = 1
let g:indentLine_char = '·'

let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <Tab> >>
nnoremap <s-tab> <<
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk
inoremap jj <esc>   " go to normal mode
inoremap kk <esc>   " go to normal mode
set pastetoggle=<F2>

" jinja2 templates
inoremap {% {%  %}<left><left><left>

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession!<CR>   " save session

" nnoremap <leader>t :NERDTreeToggle<CR>
let g:SuperTabDefaultCompletionType = "<c-n>"

" Relative Number Line
" set number      " show line numbers
set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" ---- ## ----
