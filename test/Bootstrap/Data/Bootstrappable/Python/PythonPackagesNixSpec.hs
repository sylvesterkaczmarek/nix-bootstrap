{-# LANGUAGE QuasiQuotes #-}

-- | Copyright : (c) Crown Copyright GCHQ
module Bootstrap.Data.Bootstrappable.Python.PythonPackagesNixSpec (spec) where

import Bootstrap.Data.Bootstrappable (Bootstrappable (bootstrapContent))
import Bootstrap.Data.Bootstrappable.Python.PythonPackagesNix (pythonPackagesNixFor)
import Bootstrap.Data.ProjectType (ProjectType (Minimal, Python), PythonVersion (Python39))
import Test.Hspec (Spec, describe, it)
import Test.Hspec.Expectations.Pretty (shouldBe)
import Text.RawString.QQ (r)

spec :: Spec
spec = describe "python-packages.nix rendering" do
  it "renders nothing for a non-Python project" do
    pythonPackagesNixFor Minimal `shouldBe` Nothing

  it "renders a Nix package list for Python projects" do
    case pythonPackagesNixFor (Python Python39) of
      Just packages ->
        bootstrapContent packages
          >>= ( `shouldBe`
                  Right
                    [r|{pythonPackages}:
with pythonPackages; [
  # Add Python package attributes here, for example:
  # numpy
]
|]
              )
      Nothing -> fail "Gave nothing for a Python project."
