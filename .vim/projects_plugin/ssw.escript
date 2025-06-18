
main(["init"]) ->
    HomeDir = os:getenv("HOME"),

    case file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw.vim", ".vimrc") of
        ok ->
            ok;
        {error, eexist} ->
            ok
    end,

    case file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw.shell.nix", "shell.nix") of
        ok ->
            ok;
        {error, eexist} ->
            ok
    end,

    0;
main(["help"]) ->
    io:format("init~n", []),
    0.
