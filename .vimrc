" view
"=============================================================
" column width
set colorcolumn=100
set relativenumber
" can see relative number and absolute current
set number
set showtabline=2
set laststatus=2

"statusline
set statusline=%<%y\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


" COLORS
" fixes glitch? in colors when using vim with tmux
set background=dark

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
" :help term.txt
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  " %lu - для printf, где % - начало формата, l - лонг, u - unsigned
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set t_Co=256
set termguicolors
colorscheme catppuccin_mocha

" other
set nowrap
set foldcolumn=3
set hlsearch
set incsearch
set wildmenu
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

" set grepcmd for specific OS
if (has('win32') || has('win64')) && match(&shell, 'sh')
        set grepprg=findstr\ /n
    else
        " игнорирует содержимое .gitignore
        set grepprg=ag\ -U\ $*
endif

" plugins
"=============================================================
set nocompatible
set showcmd
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
runtime vimwiki.vim
"=============================================================

" позволяет прыгнуть из несохранённого буфера в другой
set hidden

