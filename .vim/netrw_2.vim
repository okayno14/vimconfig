" Открывает Vexplore слева
let g:netrw_altv=0
" Уменьшает стандартный размер прводника.
let g:netrw_winsize = 25
" Открывает файл системным viewer-ом
let g:netrw_browsex_viewer='xdg-open'
" Открывает файл в правом окне, если проводник слева
let g:netrw_chgwin=2

let g:netrw_preview   = 1

augroup netrw_mapping
	" :if !exists("autocommands_loaded")
	" :  let autocommands_loaded = 1
	" :  au ...
	" :endif
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

function! NetrwMapping()
    " TODO добавить переход на активное окно и открытие того же буфера
    " Не работает при g:netrw_liststyle = 3 (дерево файлов)
    nmap <buffer> ff :call SaveFileaAndQuit()
endfunction

function SaveFileaAndQuit()
    normal %
    write
    call EditParentFile()
endfunction

function EditParentFile()
    let l = split(@%, "/")
    let l = l[0:-2]
    let cmd = "e " . "/" . join(l, "/")
    execute(cmd)
endfunction

