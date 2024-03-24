autocmd CursorHold,CursorHoldI * checktime
autocmd BufWritePre * TsDel
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()
