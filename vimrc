set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'gregsexton/MatchTag'    " matching html tag
Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-monokai'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable   " enable syntax highlighting
colorscheme monokai


set so=7
set hidden      " dont close buffers, only hide
set mouse=a     " enable mouse
set ttyfast                  " we have a fast terminal
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
set statusline+=%{fugitive#statusline()}
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

nmap <leader>w :w!<cr>
inoremap <leader>w <Esc>:w!<CR>
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>fw :FixWhitespace<cr>

noremap < >
noremap > <
nnoremap j gj
nnoremap k gk

noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp $HOME/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ms :mksession!<CR>   " save session
nnoremap <leader><c-b> gg=G
nnoremap <leader><space> :nohlsearch<CR>


" Relative Number Line
set nu
set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" plugin settings
" let g:indentLine_char = '·'
" let g:indentLine_char = '▸'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" syntastic 'default' settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" autoreload vimrc
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

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

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_winsize = 15
let g:netrw_hide = 1                " show not-hidden files
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_list_hide= '\..*\/,.*\.pyc,.*\.swp'
let g:netrw_liststyle=3


