let
  pkgs = import <nixpkgs> {};
in

pkgs.mkShell {
  packages = with pkgs; [
    elixir
    erlang
    rebar3
    erlang-language-platform
  ];
}


