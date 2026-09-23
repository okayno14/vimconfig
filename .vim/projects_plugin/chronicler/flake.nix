{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        shellHook = ''
          export PS1="[nix-shell:\u@\h:\w]\$ "
          echo "Entered dev-shell"
        '';
        buildInputs = [
          pkgs.beam27Packages.elixir
          pkgs.beam27Packages.elixir-ls
          pkgs.erlang-language-platform
        ];
      };
    };
}
