{
  description = "neovim flake - only lua configs";

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};

    myNvim = pkgs.symlinkJoin {
      name = "nvim-and-configs";
      paths = [
        pkgs.neovim
        (pkgs.callPackage ./nix {})
      ];
    };
  in {
    packages.x86_64-linux.default = myNvim;

    devShells.x86_64-linux.default = pkgs.mkShellNoCC {
      shellHook = ''
        alias nv='${myNvim}/bin/nvim'
        echo 'devshell for testing neovim+lua configs loaded.'
      '';
      packages = [myNvim];
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
}
