setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=0
setlocal formatprg=mix\ format\ -
setlocal foldmethod=syntax

nnoremap <buffer> <leader>fr :grep --elixir <Space>

" Терм предварительно должен быть скопирован
function FormatTerm()
    enew | execute "set filetype=elixir" | 0put 0 | execute "normal VGgJ" | execute "normal Vgq"
endfunction

