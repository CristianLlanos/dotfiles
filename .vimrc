version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)

" abrir nueva pestaña con <CTRL-P>
map <C-P> :tabnew<Enter>
" abrir ventana horizontal con <CTRL-N>
map <C-N> <C-W>n
" abrir ventana vertical con <CTRL-N>n
map <C-N>n :vsp<Enter>
" cerrar ventana con <CTRL-C>
map <C-C> <C-W>c
" ir a la ventana de arriba con <CTRL-K>
map <C-K> <C-W>k
" ir a la ventana de abajo con <CTRL-J>
map <C-J> <C-W>j
" ir a la ventana de la derecha con <CTRL-H>
map <C-H> <C-W>h
" ir a la ventana de la izquierda con <CTRL-L>
map <C-L> <C-W>l
" cambiar a pestaña izquierda con <SHIFT-H>
map <S-H> gT
" cambiar a pestaña derecha con <SHIFT-L>
map <S-L> gt

" tecla de borrado para novatos
set backspace=indent,eol,start
" espacios entre líneas
" set linespace=10

set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=1000

" habilita el uso del mouse
set mouse=a
" oculta el mouse mientras se escribe

" ignora la capitalización de las letras al momento de buscar
set ignorecase
" resalta los resultados de la búsqueda
set hlsearch
" muestra resultados conforme se tipea
" 'inner sentence'
set is

" muestra la barra de estado
" set laststatus=2

" muestra una lista en lugar de autocompletar
set wildmenu

set nomodeline

" mostrar números de líneas
" set number
" muestra la pocisión del cursor y su ubicación en porcentaje
set ruler

" evita crear una copia de respaldo cada vez que abre un archivo
set nobackup

" evitar que el texto pase a la siguiente línea
set nowrap

" esquema de colores
color desert
" tipo de fondo
set background=dark

" longitud del tabulador
set tabstop=4
" permite al backspace borrar la sangría
set softtabstop=4
" longitud de la tabulación <shitf><</>>
set shiftwidth=4
" convierte la tabulación en esepacios
set expandtab
" auto-sangría
set autoindent

set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" vim: set ft=vim :
