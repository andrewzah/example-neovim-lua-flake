{
  description = "neovim flake - only lua configs";

  outputs = {
    nixpkgs,
    oldnixpkgs,
    tolerable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    oldPkgs = import oldnixpkgs {
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
          oldPkgs.nodejs_18
          rustc
          cargo
          rust-analyzer
          curl
          ripgrep
          git
          clang
          mold
          postgresql
          pkg-config
        ]
        ++ pkgs.callPackage ./node-pkgs.nix {customNodeJS = oldPkgs.nodejs_18;};
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
    oldnixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/8b27c12.tar.gz";

    tolerable.url = "github:wires-org/tolerable-nvim-nix";
    tolerable.inputs.nixpkgs.follows = "nixpkgs";
  };
}
