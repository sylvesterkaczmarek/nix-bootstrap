{-# LANGUAGE QuasiQuotes #-}

-- | Copyright : (c) Crown Copyright GCHQ
module Bootstrap.Nix.Expr.Python (pythonPackagesBinding) where

import Bootstrap.Nix.Expr (Binding, nixbinding)

-- | A Python environment built from the package list in nix/python-packages.nix.
pythonPackagesBinding :: Binding
pythonPackagesBinding =
  [nixbinding|pythonPackages = nixpkgs.python3.withPackages (pythonPackages: import ./nix/python-packages.nix { inherit pythonPackages; });|]
