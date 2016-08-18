" set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less'
Plug 'jlanzarotta/bufexplorer'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Raimondi/delimitMate'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdtree'

" themes
Plug 'nanotech/jellybeans.vim'
Plug 'scwood/vim-hybrid'
Plug 'sickill/vim-monokai'
Plug 'chriskempson/base16-vim'

call plug#end()            " required
filetype plugin indent on    " required

syntax enable   " enable syntax highlighting
" set t_Co=256
let base16colorspace="256"
set background=dark
execute "colorscheme ".$COLORSCHEME
let g:airline_theme=$AIRLINE_THEME

set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    " set guifont=Menlo\ 11
    set guifont=DejaVu\ Sans\ Mono\ 11

    " toggling the display of a widget
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
endif


" set t_ut=       "fix colorschemes in tmux
set so=7
set hidden      " dont close buffers, only hide
set mouse=a     " enable mouse
" set ttyfast                  " we have a fast terminal
set fdm=manual
set showcmd                  " show command in bottom bar
set wildmenu                 " visual autocomplete for command menu
set hlsearch    " highlight matches
set smartcase
set infercase
set autochdir
set showmatch   " highlight matching [{()}]
set incsearch   " search as chars are entered
set ignorecase
set cursorline
set autoindent  " indent when moving to the next line while writing code
set noerrorbells                " No error bells please
set timeoutlen=500              " keypress timeout
set laststatus=2
" set clipboard=unnamedplus           " use system clipboard by default
set wildignore=*.o,*~,*.pyc     " ignore compiled files
set backspace=indent,eol,start  " allow backspacing over everything in insert mode"
let python_highlight_all = 1
" indentation
set expandtab   " expand tabs into spaces
set shiftwidth=2
set softtabstop=2               " number of spaces in tab editing
set tabstop=2
"  backup
set backup
set backupdir=$HOME/.vim/.tmp
set directory=$HOME/.vim/.tmp " Don't clutter my dirs up with swp and tmp files"
" set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

let mapleader=","
let maplocalleader="\\"
set pastetoggle=<F2>

map <Up> gk
map <Down> gj
" map <silent> <leader>t :call ToggleVExplorer()<CR>
map <leader>t :NERDTreeToggle<cr>

noremap < >
noremap > <
nnoremap j gj
nnoremap k gk

noremap <up>    :echom 'dont be a noob'<CR>
noremap <down>  :echom 'dont be a noob'<CR>
noremap <left>  :echom 'dont be a noob'<CR>
noremap <right> :echom 'dont be a noob'<CR>

inoremap jj <esc>   " go to normal mode
inoremap {% {%  %}<left><left><left>

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

inoremap <leader>w <Esc>:w!<CR>
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ez :edit $HOME/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> AirlineRefresh<CR>
nnoremap <leader>ms :mksession!<CR>   " save session
nnoremap <leader><c-b> magg=G'a         " indent file and go back to cursor pos
nnoremap <leader><space> :nohlsearch<CR>
let @/ = ""             " clear last search when sourcing vimrc

nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>w :w!<cr>
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>fw :FixWhitespace<cr>
" relative number line
set nu
set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" This autocommand jumps to the last known position in a file
"       just after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ---- plugin settings -----

" let g:indentLine_char = '·'
let g:SuperTabCompleteCase='ignore'
let g:SuperTabDefaultCompletionType = "context"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" ----- tmuxline settings -----
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '▶',
    \ 'left_alt': '',
    \ 'right' : '◀',
    \ 'right_alt' : '',
    \ 'space' : ' '}
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'win'  : '#W',
"       \'cwin' : '#W',
"       \'x'    : '%a',
"       \'y'    : '%R',
"       \'z'    : '#H'}
let g:tmuxline_preset = "minimal"

" ----- promptline settings -----
let g:promptline_powerline_symbols = 0
let g:promptline_symbols = {
    \ 'left'       : '▶',
    \ 'left_alt'   : '▶',
    \ 'right'      : '◀',
    \ 'right_alt'  : '◀',
    \ 'dir_sep'    : '/',
    \ 'truncation' : '...',
    \ 'vcs_branch' : '⎇  ',
    \ 'space'      : ' '}
let g:promptline_preset = {
        \'a' : [ '%*' ],
        \'b' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#vcs_branch() ],
        \'y' : [ promptline#slices#git_status() ],
        \'z' : [ promptline#slices#python_virtualenv() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'options': {
            \'left_sections' : [ 'a', 'b' ],
            \'right_sections': [ 'x', 'y', 'z' ]}}

" ----- airline settings -----

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" unicode symbols

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" toggle vexplore with <leader>t
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

" hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_winsize = 25
let g:netrw_hide = 1                " show not-hidden files
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_list_hide= '\..*\/,.*\.pyc,.*\.swp'
let g:netrw_liststyle=3

