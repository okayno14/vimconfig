
function! s:hi(group, guisp, guifg, guibg, gui, cterm)
  let cmd = ""
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd = cmd . " gui=" . a:gui
  endif
  if a:cterm != ""
    let cmd = cmd . " cterm=" . a:cterm
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

colorscheme catppuccin-mocha

hi! def link CursorColumn CursorLine
hi LspWarningHighlight term=underline cterm=underline ctermfg=167 ctermbg=52 gui=underline guifg=#f9e2af guibg=#45475a
hi! def link lspReference MatchParen

" highlight-groups, используемые vim-lsp для подсветки экспортнутых erlang-фукнкций
" hi! def link erlangLocalFuncCall Normal
" hi! def link LspSemanticFunction Function
