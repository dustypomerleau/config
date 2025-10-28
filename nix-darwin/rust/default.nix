{ pkgs, ... }:

let
  inherit (pkgs) callPackage;

  cargo-interactive-update = callPackage ./cargo-interactive-update.nix { };
  cargo-leptos = callPackage ./cargo-leptos.nix { };
  leptosfmt = callPackage ./leptosfmt.nix { };
  rimage = callPackage ./rimage.nix { };
in
{
  environment.systemPackages = [
    cargo-interactive-update
    cargo-leptos
    leptosfmt
    rimage
  ];
}
