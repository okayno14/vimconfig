" mappings
nnoremap <leader>M :registers hjkl<CR>:normal @

" commands
command -nargs=0 ClearM let @h="" | let @j="" | let @k="" | let @l=""
command -nargs=1 AddM call s:add_m(<f-args>)

" function realization
function s:add_m(reg)
    let macro = ":b " .. expand("%") .. ""
    let cmd = "let @" .. a:reg .. " = " .. "\"" .. macro .. "\""
    " echo cmd
    execute(cmd)
endfunction

