set makeprg=./bu\ node\ co\ re\ async\ ntc\ no-color\ with-tests

let g:fuzzbox_files_ignore_file = ['*.beam', '*.so', '*.exe', '*.dll', '*.dump', '*.core', '*.swn', '*.swp']
let g:fuzzbox_files_ignore_dir = ['.git', '.hg', '.svn', '.rebar', '.eunit', 'ecss-node']

" флаг, который говорит, что нужно использовать SetErlangCustomPath
let g:erlang_custom_path = v:true

" функция, которая проставляет &path
function SetErlangCustomPath()
    set path=
    set path+=apps/**
    set path+=elixir_libs/**
    set path+=src/**
    set path+=deps/**
    set path+=_build/default/lib/**
    set path+=config/**
    set path+=env/**
endfunction

set grepprg=ag\ -U\ $*\ apps/\ elixir_libs/\ src/\ _build/default/lib/\ config/\ env/

nnoremap <leader>fr :grep --erl --elixir<Space>

" echomsg 'ft='. &filetype

" ТАК НАДО (почему-то объявлять ft надо в конце, чтобы подтянулся системный
" скрипт для erlang-а и файл в ~/.vim/after/ftplugin)
set filetype=erlang
