set formatprg=jq\ .

" Терм предварительно должен быть скопирован
function! FormatTerm()
    enew | execute "set filetype=json" | 0put 0 | execute "normal VGgJ" | execute "normal Vgq"
endfunction

