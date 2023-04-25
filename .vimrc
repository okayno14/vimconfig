set nocompatible

" column width
set colorcolumn=100

" tabs
set autoindent
set smartindent
" press <tab>
" use :retab for replacing \t to <space> * tabstop
set smarttab
set tabstop=4
" using < or >
set expandtab
set shiftwidth=4

" registers
set clipboard=unnamed,unnamedplus

" view
set number
syntax on
filetype on
filetype plugin on
filetype indent off

function TurnOffAutoInsertCommentLeader()
    set fo-=r
    set fo-=o
endfunction

" turn off new line comments
autocmd BufNewFile,BufReadPost * call TurnOffAutoInsertCommentLeader()

