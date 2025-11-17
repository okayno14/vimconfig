let g:vimwiki_list = [
    \{'path': '~/srv/tasks/', 'syntax': 'markdown', 'ext': 'md', 'custom_wiki2html': 'wiki2html.sh'},
    \{'path': '~/srv/knowledge/', 'syntax': 'markdown', 'ext': 'md', 'custom_wiki2html': 'wiki2html.sh'},
\]

let g:vimwiki_folding='syntax'

command LastWeekWikiFiles call s:HandleLastWeekWikiFiles()

function s:HandleLastWeekWikiFiles()
    let buffer = 'last_week_wiki_files'
    let job =
    \ s:LastWeekWikiFilesCMD0()
    \ ->split()
    \ ->job_start({'out_io': 'buffer', 'out_name': buffer, 'timeout': 1800000})
    " сплитануть окно, открыть буфер, прыгнуть обратно
    wincmd s
    exe 'b ' . buffer
    wincmd p
    return job
endfunction

function s:LastWeekWikiFilesCMD0()
    return
    \ g:vimwiki_wikilocal_vars
    \ ->get(vimwiki#vars#get_bufferlocal('wiki_nr'))
    \ ->get('path')
    \ ->s:LastWeekWikiFilesCMD1()
endfunction

function s:LastWeekWikiFilesCMD1(path)
    return 'find ' . a:path . ' -type f -name *.md -mtime -6'
endfunction

