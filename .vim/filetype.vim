" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.redminewiki          setfiletype redminewiki
  au! BufRead,BufNewFile rebar.config           setfiletype erlang
  au! BufRead,BufNewFile *.log*                 setfiletype log
augroup END
