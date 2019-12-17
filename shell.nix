{ nixpkgs ? import (builtins.fetchGit {
  # Descriptive name to make the store path easier to identify
  name = "nixos-17.09-2019-12-17";
  url = https://github.com/nixos/nixpkgs-channels;
  # Commit hash for nixos-unstable as of 2019-12-17
  # `git ls-remote https://github.com/nixos/nixpkgs-channels nixos-17.09`
  rev = "14f9ee66e63077539252f8b4550049381a082518";
  ref = "nixos-17.09";
}) {}, compiler ? "ghc7102" }:
(import ./default.nix { inherit nixpkgs compiler; }).env
