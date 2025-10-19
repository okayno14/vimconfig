
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

colorscheme catppuccin_mocha

hi! def link CursorColumn CursorLine
" vim-lsp
hi! def link lspReference MatchParen
hi! def link LspWarningHighligh SpellCap
hi LspErrorHighlight term=underline cterm=underline ctermfg=167 ctermbg=52 gui=underline guifg=#cc6666 guibg=#5f0000
hi! def link lspInlayHintsParameter Label

