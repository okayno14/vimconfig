" Делаем глобально, чтобы работало в терминальном буфере
set suffixesadd+=.erl
set suffixesadd+=.ex

setlocal textwidth=0
setlocal colorcolumn=85
setlocal formatprg=erlfmt\ --print-width\ 85\ -
" Для отображения trailing spaces
setlocal list

" Добавлено, т.к. $VIM/ftplugin/erlang.vim выставляет свои значения. Я хочу их
" переопределить в рамках проекта
" Тут тоже надо применить глобально, чтобы работал поиск из терминального буфера
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
    setlocal makeprg=env\ TERM=dumb\ rebar3\ compile
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

" TODO переименовать на DepsRebar3, сделать DepsMix
" Позволяет искать приложения, зависимые от <args>
" Есть нюанс: при использовании в vimwiki может ломать настройки, т.к. при
" добавлении вставок кода читается текущий скрипт.
" Тут по-другому наверное никак.
command -nargs=1 -bar Deps grep '\b<args>\b,' -G '.*\.app\.src$' | copen
command -nargs=1 -bar Depsl lgrep '\b<args>\b,' -G '.*\.app\.src$' | lopen
nnoremap <leader>fr :grep --erl <Space>

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

" Делаем глобально, чтобы работало в терминальном буфере
nnoremap gF :<C-u>call <SID>GoToFile(v:count)<CR>

function s:GoToFile(...)
    let oldpos = getpos(".")
    let count = get(a:, 0, 1)
    try
        normal viW
        let selection_text_list = getregion(getpos("v"), getpos("."))
        normal 
        let l:selection_text = get(selection_text_list, 0, "")
        " Возвращаем курсор текущую позицию перед переходом
        call setpos(".", oldpos)
        if selection_text == ""
            throw "no text"
        endif
        let list =
        \ l:selection_text
        \ ->trim('[]', 1)
        \ ->substitute(':[a-z_]\+/[0-9]\+','','')
        \ ->split(':')
        let file = get(list, 0, "")
        let line = get(list, 1, "")
        if file == "" || line == ""
            throw "not module:line"
        endif
        let file = findfile(file, &path, count)
        if file == ""
            throw "no file"
        endif
        let bufnr = bufadd(file)
        " Надо, чтобы при наличии swap-файла ошибка не помешала функции
        " доработать
        silent! call bufload(bufnr)
        execute "b " . bufnr
        call setcursorcharpos(line, 1)
    catch
        " Отображает содержимое ошибки, оставил для дебага
        " echom v:exception
    endtry
endfunction

runtime after/ftplugin/erl_fold.vim
runtime after/plugin/no_auto_comments.vim

