set makeprg=./bu\ node\ co\ re\ async\ ntc\ no-color\ with-tests
set ft=erlang

let g:fuzzyy_files_ignore_file = ['*.beam', '*.so', '*.exe', '*.dll', '*.dump', '*.core', '*.swn', '*.swp']
let g:fuzzyy_files_ignore_dir = ['.git', '.hg', '.svn', '.rebar', '.eunit', 'ecss-node']

let g:lsc_server_commands = {
    \ 'erlang': {
    \   'name': 'erlang.elp',
    \   'command': 'nix-shell --command "elp server"',
    \   'enabled': v:true,
    \ },
    \}

