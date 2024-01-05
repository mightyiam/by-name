{
  description = "Trivial, Nixpkgs-inspired pkgs/by-name implementation";

  outputs = {...}: {
    lib.trivial = import ./trivial.nix;
  };
}
