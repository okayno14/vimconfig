
main([]) ->
    HomeDir = os:getenv("HOME"),
    ok = file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw.vim", ".vimrc"),
    ok = file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw.shell.nix", "shell.nix"),
    0.

