{
  description = "neovim flake - only lua configs";

  outputs = {
    nixpkgs,
    node18-nixpkgs,
    mold-nixpkgs,
    tolerable,
    rust-overlay,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [rust-overlay.overlays.default];
    };
    node18Pkgs = import node18-nixpkgs {
      inherit system;
      config.allowBroken = true;
    };
    moldPkgs = import mold-nixpkgs {
      inherit system;
      config.allowBroken = true;
    };

    neovimConfig1 = inputs.tolerable.makeNeovimConfig "config1" {
      inherit pkgs;
      src = pkgs.lib.fileset.toSource {
        root = ./.;
        fileset = ./config1;
      };
      config = {
        plugins = with pkgs.vimPlugins;
          [
            vim-fugitive
            coc-nvim
            coc-rust-analyzer
            coc-json
            coc-tsserver
            coc-eslint
            coc-pyright
            coc-tailwindcss
            telescope-nvim
          ]
          ++ pkgs.callPackage ./vim-plugins.nix {};
      };
      path = with pkgs;
        [
          rust-bin.stable."1.81.0".default

          node18Pkgs.nodejs_18
          moldPkgs.mold

          rust-analyzer
          curl
          ripgrep
          git
          clang
          mold
          postgresql
          pkg-config
        ]
        ++ pkgs.callPackage ./node-pkgs.nix {customNodeJS = node18Pkgs.nodejs_18;};
    };
  in {
    packages.x86_64-linux.default = neovimConfig1;

    devShells.x86_64-linux.default = pkgs.mkShellNoCC {
      packages = [neovimConfig1];
      shellHook = ''
        #export NPM_CONFIG_PREFIX=/home/node/.npm-global
        echo 'devshell for testing neovim+lua configs loaded.'
      '';
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # pinned nixpkgs
    node18-nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/8b27c12.tar.gz";
    mold-nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/e0ed589d7422c1d7a1bdd1e81289e2428c6ec2a3.zip";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    tolerable.url = "github:wires-org/tolerable-nvim-nix";
    tolerable.inputs.nixpkgs.follows = "nixpkgs";
  };
}
