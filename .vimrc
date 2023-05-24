" view
"=============================================================
" column width
set colorcolumn=100
set number
set showtabline=2
"=============================================================

"tabs
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

"autoread
"=============================================================
set autoread
au CursorHold,CursorHoldI * checktime
"=============================================================

"autocomments
"=============================================================
function TurnOffAutoComments()
    set fo-=r
    set fo-=o
endfunction

" turn off new line comments
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()
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
so ~/.vim/plugins/trailing_spaces.vim
"=============================================================

