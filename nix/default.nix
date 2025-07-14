{
  pkgs,
  stdenv,
  lib,
  ...
}:
stdenv.mkDerivation {
  pname = "example-neovim-config";
  version = "1.0.0";

  src = lib.cleanSource ../.;

  buildInputs = (import ./dependencies.nix {inherit pkgs;}).packages;

  installPhase = ''
    mkdir $out
    cp -r lua init.lua $out
  '';
}
