let g:vimwiki_list = [
    \{'path': '~/srv/tasks/', 'syntax': 'markdown', 'ext': 'md', 'custom_wiki2html': 'wiki2html.sh'},
    \{'path': '~/srv/knowledge/', 'syntax': 'markdown', 'ext': 'md', 'custom_wiki2html': 'wiki2html.sh'},
\]

let g:vimwiki_folding='syntax'

" TODO пихнуть в команду
function HandleLastWeekWikiFiles()
    let files = LastWeekWikiFiles()
    wincmd s
    " TODO надо сделать фейк-буфер без сохранения на диск (может быть тот же preview-window)
    exe 'e ' . tempname()
    call setline(1, files)
    w
endfunction

function LastWeekWikiFiles()
    let wiki_nr = vimwiki#vars#get_bufferlocal('wiki_nr')
    return LastWeekWikiFiles_1(get(g:vimwiki_wikilocal_vars[wiki_nr], 'path'))
endfunction

" TODO надо сделать фоновой джобой
function LastWeekWikiFiles_1(path)
    return systemlist('find ' . a:path . ' -type f -name ''*.md'' -mtime -6')
endfunction

