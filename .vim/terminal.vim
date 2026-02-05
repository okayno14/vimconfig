if !has('nvim')
    finish
endif

tnoremap <expr> <C-R>p '<C-\><C-N>"'.nr2char(getchar()).'pi'
nmap <leader>tt :ls Rt<cr>:b<space>

command -nargs=0 ClearHist call s:clear_hist()

function s:clear_hist()
    " TODO надо сделать дефолтную чиселку и доставать её в этой функции
    let scrollback = 99999
    let &scrollback = 1
    let &scrollback = scrollback
endfunction
