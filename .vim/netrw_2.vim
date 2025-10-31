" Открывает Vexplore слева
let g:netrw_altv=0
" Уменьшает стандартный размер прводника.
let g:netrw_winsize = 25
" Открывает файл системным viewer-ом
let g:netrw_browsex_viewer='xdg-open'
" Открывает файл в правом окне, если проводник слева
let g:netrw_chgwin=2

let g:netrw_preview   = 1

function! NetrwMapping()
    " Не работает при g:netrw_liststyle = 3 (дерево файлов)
    nmap <buffer> ff %:w:buffer #
endfunction

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

