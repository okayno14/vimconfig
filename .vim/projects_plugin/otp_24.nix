let
    pkgs_otp24 = import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/05ae8b52071ff158a4d3c7036e13a2e932b2549b.tar.gz";
    }) {};
in

pkgs_otp24.mkShell {
  packages = with pkgs_otp24; [
    erlang
    elixir
    rebar3
  ];
}
