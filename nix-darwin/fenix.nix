# Examples of configuring unpackaged Rust repos:
# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/rust/cargo-generate/default.nix#L56

{ fenix, pkgs, ... }:
{
  nixpkgs.overlays = [ fenix.overlays.default ];

  environment.systemPackages = with pkgs; [
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "miri"
      "rust-docs"
      "rust-src"
      "rustc" # includes rust-std
      "rustfmt"
    ])
    rust-analyzer-nightly
  ];
}