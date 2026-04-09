
if !has('nvim')
    finish
endif

execute "terminal" | RenameBuffer ds | call chansend(b:terminal_job_id, "./bu ds cn ntc")
execute "terminal" | RenameBuffer myc | call chansend(b:terminal_job_id, "./bu mycelium cn ntc")
execute "terminal" | RenameBuffer sip | call chansend(b:terminal_job_id, "./bu pa-sip cn ntc")
execute "terminal" | RenameBuffer ccn | call chansend(b:terminal_job_id, "cocon.bash")


