let g:fuzzbox_files_ignore_file = ['*.beam', '*.so', '*.exe', '*.dll', '*.dump', '*.core', '*.swn', '*.swp']
let g:fuzzbox_files_ignore_dir = ['.git', '.hg', '.svn', '.rebar', '.eunit', 'ecss-node']

augroup filetypedetect
    au! BufRead,BufNewFile */ecss/*.config setfiletype erlang
augroup END

" коллбэк, который проставляет &path (вызовется в ~/.vim/after/erlang.vim)
function SetErlangCustomPath()
    set path=
    set path+=apps/**
    set path+=elixir_libs/**
    set path+=src/**
    " депсы в rebar1
    set path+=deps/**
    " депсы в rebar3
    set path+=_build/default/lib/**
    " депсы в 3.18 (mix)
    set path+=_deps/**
    set path+=config/**
    set path+=env/**

    call GrepprgFromPath()
endfunction

" коллбэк (вызовется в ~/.vim/after/erlang.vim)
function SetMakeprg()
    set makeprg=./bu\ node\ co\ re\ async\ ntc\ no-color\ with-tests
endfunction

nnoremap <leader>fr :grep --erl --elixir<Space>

" echomsg 'ft='. &filetype

" ТАК НАДО (почему-то объявлять ft надо в конце, чтобы подтянулся системный
" скрипт для erlang-а и файл в ~/.vim/after/ftplugin)
set filetype=erlang
