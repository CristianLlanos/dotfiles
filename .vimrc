set nocompatible
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

" Color scheme name (peacocks-in-space)
colorscheme material-theme
" Background (light, dark)
set background=dark
" Use font
set guifont=Droid\ Sans\ Mono\ for\ Powerline
" Removes menu from top
set go-=m
" Removes toolbar from top
set go-=T
" Removes rigth hand scrollbar
set go-=r
" Removes left hand scrollbar
set go-=L
" Do not show tabs
" set showtabline=0

" Do not wrap text
set nowrap
" Spaces between lines
set linespace=16
" Enables backspace to erase text
set backspace=indent,eol,start

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
" Remove search results
command! H let @/=""

" Show status bar
set laststatus=2

" Show a list instead of autocompletion
set wildmenu
" Don't show these files/folders when using autocompletion
set wildignore+=*/vendor/**

" Do not use modeline (vim per file configuration)
set nomodeline

" Do not creat backup files
set nobackup
" Backup directory
" set backupdir=~/.vim/backup//
" Swap files directory
" set directory=~/.vim/swap//

" Allways show what mode you are in
set showmode

" Don't beep
set visualbell
set noerrorbells



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

" Quickly go forwards and backwards through buffers (tabs)
nmap :bb :BufSurfBack<CR>
nmap :bf :BufSurfForward<CR>

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
nnoremap <F10> :b <C-Z>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/


" PHPUnit
nmap <leader>t :!phpunit



" CtrlP
nmap <C-p> :CtrlP<CR>
nmap <C-r> :CtrlPBufTag<CR>

" NERDTree
nmap <A-1> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Vim Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlSpace
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" Open fuzzy search for files
nmap <C-S-n> :CtrlSpace O<CR>
nmap <C-CR> :CtrlSpace h<CR><S-p>

" Tagbar
nmap <A-2> :TagbarToggle<CR>

" GitGutter
" let g:gitgutter_highlight_lines = 1

" FuzzyFinder
nmap :ff :FufFileWithCurrentBufferDir<CR>
nmap :fb :FufBuffer<CR>
nmap :ft :FufTaggedFile<CR>

" Php Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
