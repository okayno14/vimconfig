if (executable('elp'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'erlang',
        \ 'cmd': ['elp', 'server'],
        \ 'allowlist': ['erlang'],
        \ })
endif

if (executable('gleam'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gleam',
        \ 'cmd': ['gleam', 'lsp'],
        \ 'allowlist': ['gleam'],
        \ })
endif

if (executable('elixir-ls'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'elixir',
        \ 'cmd': ['elixir-ls'],
        \ 'allowlist': ['elixir'],
        \ })
endif

" Logs

" let g:lsp_show_message_log_level='info'
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:lsp_log_verbose = 1

let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_virtual_text_enabled = 0

let g:lsp_float_max_width = 0

let g:lsp_inlay_hints_enabled = 1
let g:lsp_inlay_hints_delay = 1000

let g:lsp_hover_ui = 'preview'
let g:lsp_hover_conceal = 2

" Для сниппетов
let g:lsp_text_edit_enabled = 1
let g:lsp_insert_text_enabled = 1

function! LspLineDiagnostics() abort
    let l:diagnostic = lsp#internal#diagnostics#under_cursor#get_diagnostic()
    if empty(l:diagnostic) | return | endif
    echo get(l:diagnostic, 'message') . "\n" . get(get(l:diagnostic, 'codeDescription'), 'href')
endfunction

packadd unused

com! LspRestartServer call s:lsp_restart_server()

function s:lsp_restart_server()
    LspStopServer
    e
endfunction

com! LspCallHierarchyIncomingTree  call lsp#call_hierarchy_tree#show(v:false)
com! LspCallHierarchyOutgoingTree  call lsp#call_hierarchy_tree#show(v:true)

com! LspInlayHintsDisable call lsp#internal#inlay_hints#_disable()
com! LspInlayHintsEnable call lsp#internal#inlay_hints#_enable()

com! LspDiagnosticsDisable call lsp#disable_diagnostics_for_buffer()
com! LspDiagnosticsEnable call lsp#enable_diagnostics_for_buffer()

com! LspDisable call lsp#disable()
com! LspEnable call lsp#enable()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <C-]> <plug>(lsp-definition)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gI <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>gR <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gh <plug>(lsp-hover)
    nmap <buffer> go <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <C-n> <plug>(lsp-next-reference)
    nmap <buffer> <C-p> <plug>(lsp-previous-reference)
    nmap <buffer> ga <plug>(lsp-code-action)
    nmap <buffer> gm <plug>(lsp-signature-help)
    nnoremap <leader>h <plug>(lsp-preview-focus)

    " Показать сообщение с ошибкой линии highlight line
    nnoremap ghl :call LspLineDiagnostics()<CR>

    let g:lsp_format_sync_timeout = 1000
    " refer to doc to add more commands

    nmap <buffer> <leader>tiz :LspCallHierarchyIncomingTree
    nmap <buffer> <leader>toz :LspCallHierarchyOutgoingTree
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    call vsnip_integ#integration#vimlsp#attach()
augroup END

