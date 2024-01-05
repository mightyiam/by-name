Trivial, Nixpkgs-inspired pkgs/by-name implementation

Inspired by [Nixpkgs' by-name directory structure](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/README.md).

- Doesn't support two-letter prefix directories.
- Trivial; exists merely to avoid this particular boilerplate.
- No dependencies.

Available under `lib.trivial`. Takes two arguments:

1. [A `callPackage` function](https://nixos.org/guides/nix-pills/callpackage-design-pattern).
2. A path to a directory containing package directories.

Returns an attribute set where names are directories and values are whatever `callPackage` returns.

Example usage in a `flake.nix`:

```nix
{
  inputs.by-name.url = "github:mightyiam/by-name";
  outputs = {
    nixpkgs,
    by-name,
    ...
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    byName = by-name.lib.trivial pkgs.callPackage;
  in {
    packages = byName ./packages;
  };
}
```
