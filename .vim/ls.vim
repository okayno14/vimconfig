au User lsp_setup call lsp#register_server({
    \ 'name': 'erlang',
    \ 'cmd': ['elp', 'server'],
    \ 'allowlist': ['erlang'],
    \ })

au User lsp_setup call lsp#register_server({
    \ 'name': 'gleam',
    \ 'cmd': ['gleam', 'lsp'],
    \ 'allowlist': ['gleam'],
    \ })

let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_virtual_text_enabled = 0

let g:lsp_float_max_width = 0

let g:lsp_inlay_hints_enabled = 1

let g:lsp_hover_ui = 'preview'
let g:lsp_hover_conceal = 2

" Для сниппетов
let g:lsp_text_edit_enabled = 1
let g:lsp_insert_text_enabled = 1

function! LspLineDiagnostics() abort
    let l:diagnostic = lsp#internal#diagnostics#under_cursor#get_diagnostic()
    if empty(l:diagnostic) | return | endif
    echo l:diagnostic
endfunction

