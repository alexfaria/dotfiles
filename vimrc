
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
Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()            " required
filetype plugin indent on    " required


syntax enable   " enable syntax highlighting
colorscheme monokai

set showcmd                     " show command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set wildignore=*.o,*~,*.pyc     " ignore compiled files
set ignorecase
set smartcase
set infercase
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set ts=4        " set tabs to have 4 spaces
set softtabstop=4   " number of spaces in tab editing
set cursorline
set showmatch   " highlight matching [{()}]
set incsearch   " search as chars are entered
set hlsearch    " highlight matches
set autoindent  " indent when moving to the next line while writing code
set expandtab   " expand tabs into spaces
set shiftwidth=4
set laststatus=2
" set scrolloff=6               " keep at least 5 lines above/below
" set sidescrolloff=6           " keep at least 5 lines left/right
set so=7
let python_highlight_all = 1
let g:indentLine_char = '·'

"  backup
set backup
set backupdir=~/.vim_backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <Tab> i<tab><esc>
nnoremap <s-tab> <<
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk
" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
inoremap jj <esc>   " go to normal mode
set pastetoggle=<F2>
nmap <leader>w :w!<cr>

" jinja2 templates
inoremap {% {%  %}<left><left><left>

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession!<CR>   " save session
" nnoremap <leader>b gg=G

nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>fw :FixWhitespace<cr>

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
" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" autoreload vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }"


" Netrw Settings
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_winsize = 15
let g:netrw_hide = 1                " show not-hidden files
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_list_hide= '\..*\/,.*\.pyc,.*\.swp'
" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir

