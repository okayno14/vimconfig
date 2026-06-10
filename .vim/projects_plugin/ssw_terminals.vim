
if !has('nvim')
    finish
endif

if !bufexists("sh")
    execute "terminal" | RenameBuffer sh
endif

if !bufexists("ds")
    execute "terminal" | RenameBuffer ds | call chansend(b:terminal_job_id, "./bu ds cn ntc")
endif

if !bufexists("myc")
    execute "terminal" | RenameBuffer myc | call chansend(b:terminal_job_id, "./bu mycelium cn ntc")
endif

if !bufexists("sip")
    execute "terminal" | RenameBuffer sip | call chansend(b:terminal_job_id, "./bu pa-sip cn ntc")
endif

if !bufexists("core")
    execute "terminal" | RenameBuffer core | call chansend(b:terminal_job_id, "./bu core cn ntc")
endif

if !bufexists("mediator")
    execute "terminal" | RenameBuffer mediator | call chansend(b:terminal_job_id, "./bu mediator cn ntc")
endif

if !bufexists("ccn")
    execute "terminal" | RenameBuffer ccn | call chansend(b:terminal_job_id, "ensure.sh cocon.bash")
endif


