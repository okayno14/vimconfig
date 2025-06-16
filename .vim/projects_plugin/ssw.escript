
main(["init"]) ->
    HomeDir = os:getenv("HOME"),

    case file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw.vim", ".vimrc") of
        ok ->
            ok;
        {error, eexist} ->
            ok
    end,

    case file:make_link(HomeDir ++ "/.vim/projects_plugin/ssw_ls.vim", ".vimrc.backup") of
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
main(["swap"]) ->
    {ok, CurrentFile} = file:read_file(".vimrc"),
    {ok, BackupFile} = file:read_file(".vimrc.backup"),
    ok = file:write_file(".vimrc", BackupFile),
    ok = file:write_file(".vimrc.backup", CurrentFile),
    0;
main(["help"]) ->
    io:format("init, swap~n", []),
    0.
