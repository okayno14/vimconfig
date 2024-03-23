" сделать suppress выписов, если пробелы не были найдены
function TrailingSpacesDel()
    :silent! %s/[ ]\+$//
endfunction

command TsDel call TrailingSpacesDel()

