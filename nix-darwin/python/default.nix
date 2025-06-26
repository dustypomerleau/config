{ pkgs, ... }:

let
  inherit (pkgs.python3Packages) callPackage;
  kaleido = callPackage ./kaleido.nix { };

in
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: [ kaleido ]))
  ];
}
