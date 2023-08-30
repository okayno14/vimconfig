" view
"=============================================================
" column width
set colorcolumn=100
set number
set showtabline=2
"=============================================================

"tabs (indents)
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

"tabs 
"=============================================================
set tabpagemax=99

"autoread
"=============================================================
set autoread
au CursorHold,CursorHoldI * checktime
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
"=============================================================

