let
    glibc_pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/7ad7b570e96a3fd877e5fb08b843d66a30428f12.tar.gz";
    }) {};

    my_glibc = glibc_pkgs.glibc;

    pkgs = import <nixpkgs> {};
in

pkgs.mkShell {
  packages = with pkgs; [
    elixir
    erlang
    rebar3
    erlang-language-platform
#      my_glibc
    cargo
  ];
}


