function! MyErlFold()
    " 1
    if match(getline(v:lnum), '%%=\{67,67\}') == 0 && match(getline(v:lnum+1), '%% ') == 0 && match(getline(v:lnum+2), '%%=\{67,67\}') == 0
        return "0"
    endif

    " 2
    if match(getline(v:lnum-1), '%%=\{67,67\}') == 0 && match(getline(v:lnum), '%% ') == 0 && match(getline(v:lnum+1), '%%=\{67,67\}') == 0
        return "0"
    endif

    " 3
    if match(getline(v:lnum), '%%=\{67,67\}') == 0 && match(getline(v:lnum-1), '%% ') == 0 && match(getline(v:lnum-2), '%%=\{67,67\}') == 0
        return "0"
    endif

    " 4
    if match(getline(v:lnum-1), '%%=\{67,67\}') == 0 && match(getline(v:lnum-3), '%%=\{67,67\}') == 0
        return ">1"
    endif

    return "="
endfunction

" Если в модуле не используются блоки то ничего не делаем
if search('%%=\{67,67\}', 'n') != 0
    setlocal foldexpr=MyErlFold()
    setlocal foldmethod=expr
endif


