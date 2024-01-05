{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.by-name.url = "path:..";

  outputs = {
    nixpkgs,
    by-name,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    byName = by-name.lib.trivial pkgs.callPackage;
    packages = byName ./packages;
    actual = packages.path;
    expected = ./packages/path;
  in
    assert actual == expected; {};
}
