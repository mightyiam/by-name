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
  in
    assert packages.path == ./packages/path;
    assert packages.dependent == "dependency"; {};
}
