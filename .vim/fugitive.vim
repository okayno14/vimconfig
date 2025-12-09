" Посмотреть последовательный ренж коммитов (MR).
" Складирует все изменённые файлы между branch_old branch_new в quickfix
" Потом на выбранном файле нужно вызвать GCompareDiffSplit (или нажать dd)
" Минус - будем работать с fugitive-объектами а не буфером, т.е. нельзя ничего
" поменять, посмотреть.
command -nargs=+ GCompare call s:g_compare_2(<f-args>)

" Посмотреть последовательный ренж коммитов (MR).
" Складирует все изменённые файлы между branch_old branch_new в quickfix
" Делает checkout на branch_new
" Потом на выбранном файле нужно вызвать GCompareDiffSplit
command -nargs=+ GCompareWithCheckout call s:g_compare_2_checkout(<f-args>)

" Вызов diffsplit для ранее определённой пары буферов
command -nargs=0 GCompareDiffSplit call s:g_diffsplit()

command -nargs=0 GFileHistory Gclog %

command -nargs=+ GFileCompare call s:g_file_compare(<f-args>)

function s:g_compare_2(branch, ...)
    " Если нет второго аргумента
    if get(a:, 1, "default2") == "default2"
        let branch_old = FugitiveHead()
        let branch_new = a:branch
    " Есть оба аргумента
    else
        let branch_old = a:branch
        let branch_new = get(a:, 1, "default2")
    endif

    exec 'Git difftool --name-only ' . branch_old . ' ' . branch_new
    let g:g_compare_branch_old = branch_old
    let g:g_compare_branch_new = branch_new
endfunction

" TODO надо удалить дубль с парсингом аргументов
function s:g_compare_2_checkout(branch, ...)
    " Если нет второго аргумента
    if get(a:, 1, "default2") == "default2"
        let branch_old = FugitiveHead()
        let branch_new = a:branch
    " Есть оба аргумента
    else
        let branch_old = a:branch
        let branch_new = get(a:, 1, "default2")
    endif

    exec 'Git checkout ' .  branch_new
    let res = fugitive#Result()

    if get(res, 'exit_status') != 0
        echoerr 'Failed Checkout (only fugitive objects)'
    endif

    exec 'Git difftool --name-only ' . branch_old
    let g:g_compare_branch_old = branch_old
    let g:g_compare_branch_new = branch_new
endfunction

function s:g_file_compare(branch, ...)
    " Если нет второго аргумента
    if get(a:, 1, "default2") == "default2"
        let branch_old = FugitiveHead()
        let branch_new = a:branch
    " Есть оба аргумента
    else
        let branch_old = a:branch
        let branch_new = get(a:, 1, "default2")
    endif

    exec 'Gclog ' . branch_old . ' ' . branch_new . ' ' . '%'
endfunction

function s:g_diffsplit()
    exec 'Gdiffsplit ' . g:g_compare_branch_old
endfunction

