" view
"=============================================================
" column width
set colorcolumn=85
set relativenumber
" can see relative number and absolute current
set number
set showtabline=2
set laststatus=2

" help setting-tabline
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s ..= '%#TabLineSel#'
    else
      let s ..= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s ..= '%' .. (i + 1) .. 'T'

    " the label is made by MyTabLabel()
    let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
  endfor

  " after the last tab page fill with TabLineFill and reset tab page nr
  let s ..= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s ..= '%=%#TabLine#%999XX'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return a:n . " " . fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

"statusline
set statusline=%<%y\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{FugitiveStatusline()}

" COLORS
" fixes glitch? in colors when using vim with tmux
set background=dark
set cursorcolumn
set cursorline

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

set encoding=utf-8
set fileencoding=utf-8

" other
set nowrap
set foldcolumn=3
set hlsearch
set incsearch
set wildmenu
set wildoptions=pum
set redrawtime=500
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

"vimpager
"=============================================================
if !exists('g:vimpager')
  let g:vimpager = {}
endif

if !exists('g:less')
  let g:less     = {}
endif

let g:less.enabled = 0
let g:vimpager.passthrough = 0

"tabs
"=============================================================
set tabpagemax=99

"autoread
"=============================================================
set autoread
"=============================================================

" search
set path+=**

set grepprg=ag\ -U\ $*

" Позволяет указать grepprg с теми же путями, что и в path.
" Полезно для программных проектов, в которых надо искать по исходникам.
function GrepprgFromPath()
    let paths =
    \ split(&path, ",")
    \ ->join(" ")

    let &grepprg = "ag -U $* ".paths
endfunction

command -complete=dir -nargs=* Grep call s:grep_specific_path(<f-args>)

function s:grep_specific_path(...)
    let s:grep_old = &grepprg
    set grepprg=ag\ -U\ $*
    " a:000 - список строк с аргументами из команды
    execute ':grep ' . join(a:000)
    let &grepprg=s:grep_old
endfunction

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

" diff
"=============================================================
set diffopt=inline:word,iwhite,filler,internal,closeoff,algorithm:myers,context:5,linematch:100,indent-heuristic,anchor

" utils
"=============================================================
command -nargs=1 RenameBuffer call s:rename_bufer(<f-args>)

function s:rename_bufer(name)
    0f
    exec 'file '.a:name
endfunction

function AbsPath()
    return getcwd() . '/' . @%
endfunction

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
runtime fuzzbox.vim
runtime maps.vim
runtime autocmd.vim
runtime vimwiki.vim
runtime slime_conf.vim
runtime vsnip.vim
runtime templates.vim
runtime dadbod_ui_complete.vim
runtime fugitive.vim
runtime tmp_file.vim
runtime colorscheme/colorscheme.vim
runtime netrw_2.vim
packadd cfilter
packadd matchit
runtime terminal.vim
"=============================================================

