set suffixesadd+=.erl
set suffixesadd+=.ex

set textwidth=0
set colorcolumn=85
set formatprg=erlfmt\ --print-width\ 85\ -
" Для отображения trailing spaces
set list

" Добавлено, т.к. $VIM/ftplugin/erlang.vim выставляет свои значения. Я хочу их
" переопределить в рамках проекта
function s:SetPath()
    set path=
    set path+=apps/**
    set path+=src/**
    set path+=_build/default/lib/**

    call GrepprgFromPath()
endfunction

" Добавлено, т.к. $VIM/ftplugin/erlang.vim выставляет свои значения. Я хочу их
" переопределить в рамках проекта
function s:SetMakeprg()
    set makeprg=env\ TERM=dumb\ rebar3\ compile
endfunction

if exists('*SetErlangCustomPath')
    call SetErlangCustomPath()
else
    call s:SetPath()
endif

if exists('*SetMakeprg')
    call SetMakeprg()
else
    call s:SetMakeprg()
endif

" Фишка в том, что при работе с vim-slime нет автодополнения.
" vim-lsc инициализируется тогда, когда видит, что открыт файл с нужным
" расширением.
" Тогда для работы с slime и работающим автодополнением нужен временный
" файлик.
command SlimeBuf execute 'e ' . tempname() . '.erl'

" позволяет переставить throws после спеки перед ней. Команда нужна, т.к.
" в коде полно таких мест из-за старого сниппета
function MoveThrowsUp()
    normal "zdd?%% @end"zp/%% @throws
endfunction

command MoveThrows call MoveThrowsUp()

" Нужен во время сниппета func.
" Чтобы использовать нужно нажать backspace и <C-Q>
" Работает так: удаляем скобки, идём до спеки, копируем, вставляем в
" аргументы, через :s убираем спецификации типов
" Var :: type()
" Var :: mod:type()
" Var :: #type{}
" Var :: [type()]
" Var :: {type()}
" imap <C-Q> dib3-yib3+%P:.s/ :: [a-zA-Z0-9_:#]\+()//g<CR>%%i
imap <C-Q> :call Foo1()

function Foo1()
    let old_search = @/
    normal dib3-yib3+%P
"     exe '.s/ :: [a-zA-Z0-9_:#]\+[({][)}]//g'
"     exe '.s/ :: [a-zA-Z0-9_:#(){}\[\]]\+[{()}]\{2,2\}[}\]]\?//g'
    exe '.s/ :: [a-zA-Z0-9_:#(){}\[\]]\+[({][)}][}\]]\?//g'
    let @/ = old_search
    normal %%l
endfunction

" Позволяет искать приложения, зависимые от <args>
command -nargs=1 -bar Deps grep '\b<args>\b,' -G '.*\.app\.src$' | copen
command -nargs=1 -bar Depsl lgrep '\b<args>\b,' -G '.*\.app\.src$' | lopen

nnoremap <leader>fr :grep --erl <Space>

runtime after/ftplugin/erl_fold.vim
runtime after/plugin/no_auto_comments.vim

