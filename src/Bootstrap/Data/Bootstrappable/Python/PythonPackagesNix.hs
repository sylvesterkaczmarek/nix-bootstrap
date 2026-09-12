-- | Copyright : (c) Crown Copyright GCHQ
module Bootstrap.Data.Bootstrappable.Python.PythonPackagesNix (PythonPackagesNix, pythonPackagesNixFor) where

import Bootstrap.Data.Bootstrappable (Bootstrappable (bootstrapContent, bootstrapName, bootstrapReason))
import Bootstrap.Data.ProjectType (ProjectType (Python))

data PythonPackagesNix = PythonPackagesNix
  deriving stock (Eq, Show)

instance Bootstrappable PythonPackagesNix where
  bootstrapName = const "nix/python-packages.nix"
  bootstrapReason = const "This configures the Python packages available in the development environment."
  bootstrapContent =
    const . pure . Right $
      unlines
        [ "{pythonPackages}:",
          "with pythonPackages; [",
          "  # Add Python package attributes here, for example:",
          "  # numpy",
          "]"
        ]

pythonPackagesNixFor :: ProjectType -> Maybe PythonPackagesNix
pythonPackagesNixFor (Python _) = Just PythonPackagesNix
pythonPackagesNixFor _ = Nothing
