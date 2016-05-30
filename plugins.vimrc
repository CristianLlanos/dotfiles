"
" Vundle Configurations
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Bundle "daylerees/colour-schemes", {"rtp": "vim/"}
Plugin 'chriskempson/base16-vim'
Plugin 'jdkanani/vim-material-theme'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'bling/vim-airline'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'majutsushi/tagbar'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'craigemery/vim-autotag'
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"---------------------------------------
" SnipMate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"--------------------------------------
Plugin 'easymotion/vim-easymotion'
Plugin 'ton/vim-bufsurf'
Plugin 'tomtom/tcomment_vim'
Plugin 'FuzzyFinder'

Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------------------------------------------------------------------
" Configurations
"-----------------------------------------------------------------------

" CtrlP
nmap <C-p> :CtrlP<CR>
nmap <C-r> :CtrlPBufTag<CR>

" NERDTree
" nmap <A-1> :NERDTreeToggle<CR>
" nmap <leader>f :NERDTreeFind<CR>
nmap <A-1> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)=<cr>

" Vim Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<S-d>'
let g:multi_cursor_skip_key='<Space>'
let g:multi_cursor_quit_key='<Esc>'

" Air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#show_buffers = 0

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
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

" GitGutter
" let g:gitgutter_highlight_lines = 1

" FuzzyFinder
nmap :ff :FufFileWithCurrentBufferDir<CR>
nmap :fb :FufBuffer<CR>
nmap :ft :FufTaggedFile<CR>

" Php import class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <leader>u :call PhpInsertUse()<CR>

" Php expand full class name
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
