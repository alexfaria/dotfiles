call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Raimondi/delimitMate'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'

" git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" language-specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/Arduino-syntax-file', { 'for': 'arduino' }
Plug 'coddingtonbear/neomake-platformio', { 'for': 'arduino' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" themes
Plug 'tomasr/molokai'

call plug#end()            " required
filetype plugin indent on    " required

colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1
let g:airline_theme="molokai"

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪          " Display unprintable characters f12 - switches

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
set fdm=manual
set smartcase
set infercase
set autochdir
set showmatch   " highlight matching [{()}]
set ignorecase
" set cursorline
set noerrorbells                " No error bells please
set timeoutlen=500              " keypress timeout
set laststatus=2
set clipboard=unnamedplus           " use system clipboard by default
set wildignore=*.o,*~,*.pyc     " ignore compiled files
let python_highlight_all = 1
" indentation
set expandtab   " expand tabs into spaces
set shiftwidth=2
set softtabstop=2               " number of spaces in tab editing
set tabstop=2

" undo after closing a file
set undofile
set backup
set undodir=/tmp
set backupdir=/tmp
set directory=/tmp " Don't clutter my dirs up with swp and tmp files"
" set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

let mapleader=","
let maplocalleader="\\"

map <Up> gk
map <Down> gj
" map <silent> <leader>t :call ToggleVExplorer()<CR>
map <leader>t :NERDTreeToggle<cr>

" indent with tab and shift-tab
vmap <S-tab> <gv
vmap <tab> >gv
nmap <S-tab> <<
nmap <tab> >>
nnoremap j gj
nnoremap k gk

" noremap <up>    :echom 'dont be a noob'<CR>
" noremap <down>  :echom 'dont be a noob'<CR>
" noremap <left>  :echom 'dont be a noob'<CR>
" noremap <right> :echom 'dont be a noob'<CR>

" enable . command in visual mode
vnoremap . :normal .<cr>

nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

inoremap jj <esc>   " go to normal mode
inoremap {% {%  %}<left><left><left>

tnoremap <Esc> <C-\><C-n>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

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
nnoremap <leader>ex :edit $HOME/.Xresources<CR>
nnoremap <leader>sx :!xrdb $HOME/.Xresources<CR><CR>
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
nmap <leader>k :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>fw :%s/\s\+$<CR>       " remove extra whitespace
nmap <leader>tr :call #tablemode#table#Realign('.')<CR>  " vim-table-mode binding to realign the table

set nu
" relative number line
" set relativenumber
" :au FocusLost * :set number
" :au FocusGained * :set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" This autocommand jumps to the last known position in a file
"       just after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ---- plugin settings -----

let g:indentLine_color_term = 239 " Vim
let g:indentLine_color_gui = '#A4E57E' "GVim

" non X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '¦'

let g:SuperTabCompleteCase='ignore'
let g:SuperTabDefaultCompletionType = "context"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
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
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list=2
let g:neomake_airline="true"
autocmd! BufWritePost * Neomake

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

