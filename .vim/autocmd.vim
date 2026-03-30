autocmd CursorHold,CursorHoldI * checktime
autocmd BufWritePre * retab | TsDel
autocmd BufNewFile,BufReadPost * call TurnOffAutoComments()
