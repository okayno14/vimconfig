autocmd CursorHold,CursorHoldI * checktime
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()

"==============================================
command EnableAutoFormat call s:enable_auto_format()
command DisableAutoFormat call s:disable_auto_format()

function s:enable_auto_format()
    autocmd BufWritePre * retab | TsDel
endfunction

function s:disable_auto_format()
    autocmd! BufWritePre *
endfunction

EnableAutoFormat
"==============================================

