# shorturls

This is a WIP do not expect it to work yet, please. Also I intend to use it more for an integration approach nix-wise than to actually enhance the program sources themselves in any way. The latter which seemingly natural as it is just kind of a tutorial according to the original author's expressed intent.

# hints for building shorturls locally using a nixpkgs installation

> cd ~/shorturls  
cabal2nix . > shorturls.nix

`default.nix` and `shell.nix` are simple copies of the default templates given in the haskell section of nix' manual, noteworthy is setting compiler version string to "ghc7102" according to [WJWH/shorturls/stack.yaml](https://github.com/WJWH/shorturls/blob/master/stack.yaml#L13). Consequently [nixpkgs=.../nixos-17.09.tar.gz](nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.09.tar.gz) is chosen as the compiler version fixed seems available just there.

The first build (`nix-build -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.09.tar.gz`) attempt triggered a package missing error, added `transformers` to cabal file plus repeated `cabal2nix` call above to reflect dependencies change. Also in subsequent builds a symbol undefined error (`<>`) was thrown, added the import to both src/Example.hs and test/Spec.hs.

> nix-shell -p which nano git haskellPackages.ghc haskellPackages.cabal-install cabal2nix redis -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.09.tar.gz  
redis-server &  
nix-build -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.09.tar.gz

# todo

integrate manual work listed above for local building to [haskell.yml](https://github.com/573/shorturls/blob/master/.github/workflows/haskell.yml#L13) as a first step.
