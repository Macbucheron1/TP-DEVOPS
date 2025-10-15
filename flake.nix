# flake.nix
{
  description = "To use c";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    version = "0.1.0";
    pkgs = import nixpkgs { inherit system; };
    src = ./.;

    commonBuildInputs = with pkgs; [
      nodejs_24
    ];

  in {

    # --- Dev Shell ---
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = commonBuildInputs;
        shellHook = ''
        export PS1="\n\[\033[1;35m\][nix-shell TP DEVOPS]\[\033[0m\] "
      '';
    };
  };
}
