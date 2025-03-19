""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 👑  MINIMALIST VIM CONFIGURATION
"    Created for movboutry
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Use Vim settings, rather than Vi settings
filetype plugin indent on       " Enable file type detection and indenting
syntax on                       " Enable syntax highlighting
set history=500                 " Set history size
set autoread                    " Auto read when a file is changed from the outside
set hidden                      " Allow buffer switching without saving

" Set leader key to space (easier to reach)
let mapleader = " "
let g:mapleader = " "

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                      " Show line numbers
set relativenumber              " Show relative line numbers (helps with navigation)
set cursorline                  " Highlight the current line
set laststatus=2                " Always display the status line
set signcolumn=yes              " Always show sign column for git markers, etc.

" Use a simple colorscheme that comes with vim
colorscheme desert

" Status line (minimal but informative)
set statusline=%f               " File path
set statusline+=%m              " Modified flag
set statusline+=%=              " Left/right separator
set statusline+=%y\ %l:%c       " File type, line:column

" Better command-line completion
set wildmenu
set wildmode=list:longest

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Show matching brackets when text indicator is over them
set showmatch

" Smooth scrolling
set scrolloff=5                 " Start scrolling when 5 lines away from margins

" Search settings
set hlsearch                    " Highlight search results
set incsearch                   " Search as characters are entered
set ignorecase                  " Ignore case when searching
set smartcase                   " When searching with uppercase, become case-sensitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, Indent Related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when using tabs
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4                   " 1 tab == 4 spaces
set autoindent                  " Auto indent
set smartindent                 " Smart indent
set wrap                        " Wrap lines

" Language-specific indentation
augroup indentation
    autocmd!
    autocmd FileType javascript,html,css,json,yaml setlocal shiftwidth=2 tabstop=2
augroup END

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation and Efficiency
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast saving and quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlighting with ESC
nnoremap <silent> <Esc> :noh<CR>

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

" Yank and paste with system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Advanced Features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo (keep undo history across sessions)
if has('persistent_undo')
    set undodir=~/.vim/undodir
    silent !mkdir -p ~/.vim/undodir
    set undofile
endif

" Auto-create directories when saving new files
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minimal Plugin Setup (via vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Just a few essential plugins
Plug 'gruvbox-community/gruvbox'          " Better colorscheme than built-in
Plug 'tpope/vim-surround'                 " For working with surroundings (quotes, brackets, etc)
Plug 'tpope/vim-commentary'               " For commenting out code easily
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                   " Fuzzy file finder (essential for productivity)
call plug#end()

" Plugin configuration (minimal)
if has('termguicolors')
    set termguicolors
endif

" Enable gruvbox theme if installed
silent! colorscheme gruvbox
set background=dark

" FZF bindings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
