set nocompatible
syntax on
set hidden
set t_Co=256

if filereadable(expand("$HOME/plugins.vimrc"))
    source $HOME/plugins.vimrc
endif

" Use unicode glyphs
set encoding=utf-8
" Elements to keep in history
set history=1000
" See commands as they are typed
set showcmd
" Shell
set shell=/bin/bash

" Color scheme name (peacocks-in-space)
" colorscheme material-theme
color PaperColor
" colorscheme base16-solarized
" colorscheme base16-monokai
" Background (light, dark)
set background=dark
" Use font
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
" set guifont=Ubuntu\ Mono\ 11
set guifont=Input\ 10
" Removes menu from top
set go-=m
" Removes toolbar from top
set go-=T
" Removes rigth hand scrollbar
set go-=r
" Removes left hand scrollbar
set go-=L
" Remove GUI tabs
set go-=e
" Allways show tabs
set showtabline=2
" Tab lables: file name
set guitablabel=%f

"-----------------------------------Splits----------------------------------"

" Send splits bellow
set splitbelow
" Send splits to the right
set splitright

" Do not wrap text
set nowrap
" Spaces between lines
set linespace=16
" Enables backspace to erase text
set backspace=indent,eol,start
" Highlight whitespaces, tabs.
set list
" set listchars=tab:»·,trail:·,extends:#,nbsp:·,space:·
" set listchars=tab:»·,trail:·,extends:#,nbsp:·
set listchars=tab:⁍ ,trail:•,extends:#,nbsp:•

" Tabs legth
set tabstop=4
" Allows backspace key to erase tabs
set softtabstop=4
" Tabs lenght when indenting with '<' and '>'
set shiftwidth=4
" Use multiple shiftwidth when indenting with '<' and '>'
set shiftround
" Use spaces for tabs
set expandtab
" Enables autoindentation
set autoindent
" Copy the previous indentation when autoindenting
set copyindent

" Show line numbers
set number
" Show line, column and position percentage in status line
set ruler

" Enables mouse interaction when using vim in terminal
set mouse=a

" Ignore case when searching
set ignorecase
" Highlight search results
set hlsearch
" Show results while typing ('inner sentence')
set is

" Show status bar
set laststatus=2

" Show a list instead of autocompletion
set wildmenu
" Don't show these files/folders when using autocompletion
" set wildignore+=*/vendor/**
" set wildignore-=*/vendor/laravel/**
" set wildignore-=*/vendor/papaya/**

set tags=./tags;/

" Do not use modeline (vim per file configuration)
set nomodeline

" Do not creat backup files
set nobackup
" Backup directory
" set backupdir=~/.vim/backup//
" Swap files directory
" set directory=~/.vim/swap//

" Do not use swap files
set noswapfile

" Allways show what mode you are in
set showmode

" Don't beep
set noerrorbells visualbell t_vb=



" With a map leader it's possible to do extra key conbinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves ,w
nmap <leader>w :w!<CR>
" Close current buffer ,q
nmap <leader>q <C-W>c
" nmap <leader>q :q!<CR>

" Browse pages
nmap <Space> <PageDown>

" Copy to clipboard
" vnoremap y "*y
" nnoremap yy 0"*y$
" Paste from clipboard
" nnoremap p a<ESC>"*p

" Open up Vim configuration file
nmap :ov :tabe $MYVIMRC<CR>
" Update (source) Vim configuration (after .vimrc was changed)
nmap :sv :source $MYVIMRC<CR>

" Use jj to escape from insert mode to normal mode
imap jj <esc>

" Down is really the next line
nnoremap j gj
" Up is really the previous line
nnoremap k gk
" Autochange directory to match the current file ,cd
" nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


" Splits
nmap vs :vs<CR>
nmap sp :sp<CR>

" Resize vsplit
nmap <C-l> :vertical resize +5<CR>
nmap 25 :vertical resize 40<CR>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<CR>

" Open a new tab with <CTRL-t>
nmap <C-t> :tabnew<Enter>
" Navigate to the right tab <ctrl-tab>
nmap <C-Tab> gt
" Navigate to the left tab <ctrl-shif-tab>
nmap <C-S-Tab> gT
" Go to the buffer above <alt-k>
nmap <A-k> <C-W>k
" Go to the buffer below <alt-j>
nmap <A-j> <C-W>j
" Go to the right buffer <alt-h>
nmap <A-h> <C-W>h
" Go to the left buffer <alt-l>
nmap <A-l> <C-W>l

" Show buffer list and select one to open
nnoremap <F5> :buffers<CR>:buffer<Space>

" Use wildmenu to filter buffers
set wildcharm=<C-Z>
nnoremap <F11> :b <C-Z>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/
" Change window working directory
nmap ,cd :lcd %:p:h<CR>


" PHPUnit
nmap <leader>t :!phpunit

