
function TmpFile(extension)
    return tempname() . a:extension
endfunction

function TmpFileCmd(extension)
    execute('e ' . TmpFile(a:extension))
endfunction

command -nargs=1 -bar TmpFile call TmpFileCmd('<args>')

" TODO тут надо сделать умную инициализацию этого файла (юзать шаблонное имя <текущий_буфер>plantuml ?)
" pre: .plantuml-буфер должен быть в # (alternate file)
function UpdateTmpAltPlantuml()
    exec 'normal ?plantumljV/endumlyggdG"0pkdd:w:make'
endfunction

