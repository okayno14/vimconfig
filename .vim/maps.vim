" Русская раскладка
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

let g:mapleader = ","

nnoremap <leader>s :%s:\<\>:
nnoremap <leader>fw :grep '\b\b':copenp
nnoremap <leader>flw :lgrep '\b\b':lopenp

" [l]ocation list
map ]l :lne
map [l :lp

" [c]uickfix
map ]q :cn
map [q :cp

" [b]uffer
map ]b :bn
map [b :bp
" open buffer list and select some
nnoremap <Leader>b :ls t<CR>:b<Space>
nnoremap <leader>bd :bd

" start of line
:cnoremap <C-A>		<Home>
" back one character
:cnoremap <C-B>		<Left>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" forward one character
:cnoremap <C-F>		<Right>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word (<A-F>)
:cnoremap f       	<S-Right>
" forward one word (<A-B>)
:cnoremap b	        <S-Left>

" simple-commenter
let g:scomment_default_mapping = 0
map  <leader>c <Plug>(do-comment)
map  <leader>C <Plug>(un-comment)
map  ,,        <Plug>(one-line-comment)

"===== FUZZY SEARCH =====

" ctrlp
" open prompt
let g:ctrlp_map = ''
nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>

" prompt navigation
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-\>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-r>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
\ }

" fuzzyy
let g:enable_fuzzyy_keymaps = 0

" open prompt
" бесполезный
" nnoremap <silent> <leader>fb :FuzzyInBuffer<CR>
nnoremap <silent> <leader>ff :FuzzyFiles<CR>
nnoremap <silent> <leader>fb :FuzzyBuffers<CR>
nnoremap <silent> <leader>fc :FuzzyColors<CR>
nnoremap <silent> <leader>fd :FuzzyHelps<CR>
nnoremap <silent> <leader>fi :FuzzyCommands<CR>
nnoremap <silent> <leader>fr :FuzzyGrep<CR>
nnoremap <silent> <leader>fh :FuzzyHighlights<CR>

" prompt navigation
let g:fuzzyy_keymaps = {
\     'menu_up': ["\<c-p>", "\<Up>"],
\     'menu_down': ["\<c-n>", "\<Down>"],
\     'menu_select': ["\<CR>"],
\     'cursor_begining': ["\<c-a>"],
\     'cursor_end': ["\<c-e>"],
\     'delete_all': ["\<c-k>"],
\     'delete_prefix': ["\<c-u>"],
\     'exit': ["\<Esc>", "\<c-c>", "\<c-[>"],
\     'preview_up': [],
\     'preview_down': [],
\     'preview_up_half_page': [],
\     'preview_down_half_page': [],
\ }
"===== FUZZY SEARCH =====

" vim-lsc
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': 'gh',
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
\}

" Показать сообщение с ошибкой линии highlight line
nnoremap ghl :call LspLineDiagnostics()<CR>

" alt_l - перезапуск lsp-сервера
nnoremap l :LSClientRestartServer<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <C-]> <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gI <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>gR <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gh <plug>(lsp-hover)
    nmap <buffer> go <plug>(lsp-document-symbol)
"     nmap <buffer> go <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <C-n> <plug>(lsp-next-reference)
    nmap <buffer> <C-p> <plug>(lsp-previous-reference)
    nmap <buffer> ga <plug>(lsp-code-action)
    nmap <buffer> gm <plug>(lsp-signature-help)
    nnoremap <leader>h <plug>(lsp-preview-focus)

    let g:lsp_format_sync_timeout = 1000
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" git (fugitive) macros
nnoremap gb :Git blame<CR>w
" для сравнения с индексом
nnoremap gd :Gdiffsplit<CR>
" для merge-конфликтов
nnoremap gm :Gdiffsplit!<CR>
nnoremap gs :Git<CR>
nnoremap gc :Git commit<CR>

nnoremap gl :Git log --graph --decorate -10<CR>
nnoremap gll :Git log --graph --decorate<CR>
nnoremap glL :Git log --graph --decorate --all<CR>
nnoremap glf :Git log --graph --decorate %<CR>

