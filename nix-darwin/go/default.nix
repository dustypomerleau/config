{ pkgs, ... }:

let
  inherit (pkgs) callPackage;

  render-cli = callPackage ./render-cli.nix { };
in
{
  environment.systemPackages = [ render-cli ];
}
