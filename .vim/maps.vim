let g:mapleader = ","

" simple-commenter
let g:scomment_default_mapping = 0
nnoremap  <leader>c <Plug>(do-comment)
nnoremap  <leader>C <Plug>(un-comment)
nnoremap  ,,        <Plug>(one-line-comment)

" ctrlp
let g:ctrlp_map = ''
nnoremap fp :CtrlP<CR>
nnoremap fb :CtrlPBuffer<CR>

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
