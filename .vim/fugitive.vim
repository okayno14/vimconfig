
" Облегчает интерактивное сравнение веток
" Как пользоваться:
" Пусть хочу посмотреть `diff branch_a branch_b`:
" Вызываем: GCompare branch_a branch_b
" Двигаемся по списку
" Теперь для сравнения вызываем: Gdiffsplit branch_a или dq
command -nargs=+ GCompare Git difftool --name-only --numstat <args>

