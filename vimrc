set nocompatible              " be iMproved, required
filetype off                  " required

if has("win32") || has("win64")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'     " close (x)html tag
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'godlygeek/tabular'
Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable   " enable syntax highlighting
colorscheme monokai

if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    " toggling the display of a widget
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
endif



set so=7
set hidden      " dont close buffers, only hide
set mouse=a     " enable mouse
set ttyfast                  " we have a fast terminal
set fdm=manual
set showcmd                  " show command in bottom bar
set wildmenu                 " visual autocomplete for command menu
set hlsearch    " highlight matches
set smartcase
set infercase
set autochdir
set showmatch   " highlight matching [{()}]
set incsearch   " search as chars are entered
set expandtab   " expand tabs into spaces
set softtabstop=4               " number of spaces in tab editing
set ts=4   " set tabs to have 4 spaces
set shiftwidth=4
set ignorecase
set cursorline
set autoindent  " indent when moving to the next line while writing code
set noerrorbells                " No error bells please
set timeoutlen=500              " keypress timeout
set laststatus=2
set clipboard=unnamed           " use system clipboard by default
set wildignore=*.o,*~,*.pyc     " ignore compiled files
set backspace=indent,eol,start  " allow backspacing over everything in insert mode"
let python_highlight_all = 1

"  backup
set backup
set backupdir=$HOME/.vim/.tmp
set directory=$HOME/.vim/.tmp " Don't clutter my dirs up with swp and tmp files"
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

let mapleader=","
let maplocalleader="\\"
set pastetoggle=<F2>

map <Up> gk
map <Down> gj
map <silent> <leader>t :call ToggleVExplorer()<CR>

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
nnoremap <leader>ez :vsp $HOME/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> AirlineRefresh<CR>
nnoremap <leader>ms :mksession!<CR>   " save session
nnoremap <leader><c-b> magg=G'a         " indent file and go back to cursor pos
nnoremap <leader><space> :nohlsearch<CR>
let @/ = ""             " clear last search when sourcing vimrc

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

" plugin settings

" let g:indentLine_char = '·'
" let g:indentLine_char = '▸'
let g:SuperTabCompleteCase='ignore'
let g:SuperTabDefaultCompletionType = "<c-n>"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#non_zero_only = 1

" ----- scrooloose/syntastic settings -----
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%{fugitive#statusline()}
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

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

