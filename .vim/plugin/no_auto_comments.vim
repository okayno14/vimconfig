"autocomments
"=============================================================
function TurnOffAutoComments()
    set formatoptions-=r
    set formatoptions-=o
endfunction

" turn off new line comments
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()
"=============================================================

