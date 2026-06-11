autocmd CursorHold,CursorHoldI * checktime
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()

let g:my_auto_format=1

command ToggleMyAutoFormat call s:toggle_my_auto_format()

function s:toggle_my_auto_format()
    if g:my_auto_format == 1
        autocmd! BufWritePre *
        let g:my_auto_format=0
    else
        autocmd BufWritePre * retab | TsDel
        let g:my_auto_format=1
    endif
endfunction
