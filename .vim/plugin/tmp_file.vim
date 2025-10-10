
function TmpFile(extension)
    return tempname() . a:extension
endfunction

function TmpFileCmd(extension)
    execute('e ' . TmpFile(a:extension))
endfunction

command -nargs=1 -bar TmpFile call TmpFileCmd('<args>')

