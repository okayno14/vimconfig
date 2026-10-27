function Init()
    if has('nvim')
        call s:init()
    endif
endfunction

function Terminate()
    if has('nvim')
        call s:terminate()
    endif
endfunction

function s:init()
    call s:ensure_terminal("sh", "")
    call s:ensure_terminal("ds", "./bu ds cn ntc")
    call s:ensure_terminal("myc", "./bu mycelium cn ntc")
    call s:ensure_terminal("sip", "./bu pa-sip cn ntc")
    call s:ensure_terminal("core", "./bu core cn ntc")
    call s:ensure_terminal("mediator", "./bu mediator cn ntc")
    call s:ensure_terminal("ccn", "ensure.sh cocon.bash")
endfunction

function s:terminate()
    bd! ds myc sip core mediator
    !docker ps -q --filter name=ecss-node* | xargs docker stop
endfunction

function s:ensure_terminal(name, cmd)
    if !bufexists(a:name)
        call s:terminal(a:name, a:cmd)
    endif
endfunction

function s:terminal(name, cmd)
    call execute("terminal")
    call execute("file"." ".a:name)
    call chansend(b:terminal_job_id, a:cmd)
endfunction
