if !has('nvim')
    finish
endif

tnoremap <expr> <C-R>p '<C-\><C-N>"'.nr2char(getchar()).'pi'
