{ pkgs, ... }:

let
  inherit (pkgs) callPackage;
  oxlint = callPackage ./oxlint.nix { };
in
{
  environment.systemPackages = [ oxlint ];
}
