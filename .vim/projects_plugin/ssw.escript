#! /usr/bin/env escript

main(["init"]) ->
    HomeDir = os:getenv("HOME"),
    make_link_ignore_exist(HomeDir ++ "/.vim/projects_plugin/ssw.vim", ".vimrc"),
    make_link_ignore_exist(HomeDir ++ "/.vim/projects_plugin/ssw.shell.nix", "shell.nix"),
    make_link_ignore_exist(HomeDir ++ "/.vim/projects_plugin/ssw_terminals.vim", "terminals.vim"),
    0;
main(["help"]) ->
    io:format("init~n", []),
    0.

make_link_ignore_exist(Target, Link) ->
    case file:make_link(Target, Link) of
        ok -> ok;
        {error, eexist} -> ok
    end.
