" сделать suppress выписов, если пробелы не были найдены
function TrailingSpacesDel()
    %s/[ ]\+$//
endfunction

command TsDel call TrailingSpacesDel()

autocmd BufWritePre * TsDel

