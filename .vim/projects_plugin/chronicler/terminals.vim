if !has('nvim')
    finish
endif

if !bufexists("cache")
  execute "terminal" | RenameBuffer cache | call chansend(b:terminal_job_id, "cd apps/chronicler_cache")
  call chansend(b:terminal_job_id, "nix develop --command iex -S mix")
endif

if !bufexists("core")
  execute "terminal" | RenameBuffer core | call chansend(b:terminal_job_id, "cd apps/chronicler_core")
  call chansend(b:terminal_job_id, "nix develop --command iex -S mix")
endif

if !bufexists("storage")
  execute "terminal" | RenameBuffer storage | call chansend(b:terminal_job_id, "cd apps/chronicler_storage")
  call chansend(b:terminal_job_id, "nix develop --command iex -S mix")
endif

if !bufexists("iface")
  execute "terminal" | RenameBuffer iface | call chansend(b:terminal_job_id, "cd apps/chronicler_interface/")
  call chansend(b:terminal_job_id, "nix develop --command iex -S mix phx.server")
endif

