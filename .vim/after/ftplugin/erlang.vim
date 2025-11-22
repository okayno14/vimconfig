set textwidth=0

set formatprg=erlfmt\ --print-width\ 85\ -
set makeprg=env\ TERM=dumb\ rebar3\ compile

set path=
set path+=apps/**
set path+=src/**
set path+=_build/default/lib/**

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

