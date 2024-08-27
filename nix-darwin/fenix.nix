# Examples of configuring unpackaged Rust repos:
# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md
# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/rust/cargo-generate/default.nix#L56

{
  pkgs,
  specialArgs,
  system,
  ...
}:
let
  fenix = specialArgs.inputs.fenix;
in
{
  nixpkgs.overlays = [ fenix.overlays.default ];

  # fenix rustc includes rust-std
  environment.systemPackages = with pkgs; [
    (
      with fenix.packages.${system};
      with complete;
      combine [
        cargo
        clippy
        miri
        rust-docs
        rust-src
        rustc
        rustfmt
        targets.wasm32-unknown-unknown.latest.rust-std
        targets.wasm32-wasi.latest.rust-std
      ]
    )
    rust-analyzer-nightly
  ];
}
