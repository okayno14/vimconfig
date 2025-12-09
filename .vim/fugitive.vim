
" Облегчает интерактивное сравнение веток
" Как пользоваться:
" Пусть хочу посмотреть `diff branch_old branch_new`:
" Путь 1 (рекоммендуемый):
" * Завести отдельный worktree, зачекаутить branch_new
" * :GCompare branch_old
" * Двигаемся по списку
" * Теперь для сравнения вызываем: Gdiffsplit branch_old
"
" Метод хорош, потому что:
" * В случае хождения по fugitive-файлу не будет работать LSP,
"   нельзя редактировать файлик (для меня это важно, т.к. иногда хочется
"   попробовать в vim-е, потом скинуть в gitlab-е модифицированный вариант кода)
"
" Путь 2
" * Вызываем: GCompare branch_old branch_new
" * Двигаемся по списку
" * Теперь для сравнения вызываем: Gdiffsplit branch_old branch_new или dd
"
" Проблема метода:
" * dd по объектам не всегда работает;

command -nargs=+ GCompare call s:g_compare(<f-args>)
command -nargs=0 GCompareDiffSplit call s:g_diffsplit()

function s:g_compare(branch_b)
    exec 'Git difftool --name-only ' . a:branch_b
    let g:g_compare_branch_b = a:branch_b
endfunction

" TODO может как-то автоматизировать? Тогда будет базированный аналог diffview
function s:g_diffsplit()
    exec 'Gdiffsplit ' . g:g_compare_branch_b
endfunction

