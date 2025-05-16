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
set statusline=%<%y\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{FugitiveStatusline()}

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

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" other
set nowrap
set foldcolumn=3
set hlsearch
set incsearch
set wildmenu
set wildoptions=pum
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

" search
set path+=**

" set grepcmd for specific OS
if (has('win32') || has('win64')) && match(&shell, 'sh')
        set grepprg=findstr\ /n
    else
        " игнорирует содержимое .gitignore
        set grepprg=ag\ -U\ $*
endif

" TODO сделать значение по умолчанию %
" Команда для быстрого поиска todo
command -nargs=1 -bar Todo grep --vimgrep todo '<args>'

" позволяет прыгнуть из несохранённого буфера в другой
set hidden

" сохранение swp-файлов в домашней папке
if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

set directory=$VIMHOME/swp//

" plugins
"=============================================================
set nocompatible
" показывает количество прыжков при поиске через n/N
set shortmess-=S
set showcmd
set exrc
set secure
syntax on
filetype on
filetype plugin on
filetype indent off

runtime ls.vim
runtime ctrlp.vim
runtime fuzzyy.vim
runtime maps.vim
runtime autocmd.vim
runtime vimwiki.vim
runtime slime_conf.vim
runtime vsnip.vim
runtime templates.vim
runtime dadbod_ui_complete.vim
runtime fugitive.vim
"=============================================================

