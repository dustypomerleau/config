# Examples of configuring unpackaged Rust repos:
# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/rust/cargo-generate/default.nix#L56

{
  pkgs,
  specialArgs,
  ...
}:
let
  fenix = specialArgs.inputs.fenix;
in
{
  nixpkgs.overlays = [ fenix.overlays.default ];

  # fenix rustc includes rust-std
  environment.systemPackages = [
    (
      with fenix.packages.${pkgs.stdenv.hostPlatform.system};
      combine [
        complete.cargo
        complete.clippy
        complete.miri
        complete.rust-docs
        complete.rust-src
        complete.rustc
        complete.rustfmt
        targets.wasm32-unknown-unknown.latest.rust-std
        targets.wasm32-wasip2.latest.rust-std
      ]
    )
    pkgs.rust-analyzer-nightly
  ];
}
