#! /usr/bin/env escript

main(["init"]) ->
    HomeDir = os:getenv("HOME"),
    ok = make_link_ignore_exist(HomeDir ++ "/.vim/projects_plugin/chronicler/terminals.vim", "terminals.vim"),
    ok = make_link_ignore_exist(HomeDir ++ "/.vim/projects_plugin/chronicler/dev", "dev"),
    0;
main([]) ->
  main(["help"]);
main(["help"]) ->
    io:format("init~n", []),
    0.

make_link_ignore_exist(Target, Link) ->
    case file:make_symlink(Target, Link) of
        ok -> ok;
        {error, eexist} -> ok
    end.
