" view
"=============================================================
" column width
set colorcolumn=100
set number
set showtabline=2

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256

" other
set nowrap
set foldcolumn=3
"=============================================================

"indents
"=============================================================
set autoindent
set smartindent
" press <tab>
" use :retab for replacing \t to <space> * tabstop
set smarttab
set tabstop=4
" using < or >
set expandtab
set shiftwidth=4
"=============================================================

" netrw
"=============================================================
let g:netrw_altv=1

"tabs
"=============================================================
set tabpagemax=99

"autoread
"=============================================================
set autoread
"=============================================================

" registers
set clipboard=unnamed,unnamedplus

" search
set path+=**

" plugins
"=============================================================
set nocompatible
set exrc
set secure
syntax on
filetype on
filetype plugin on
filetype indent off

runtime ls.vim
runtime ctrlp.vim
runtime maps.vim
runtime autocmd.vim
"=============================================================

