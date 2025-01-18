{
  lib,
  rustPlatform,
  fetchCrate,
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-interactive-update";
  version = "0.4.2";

  src = fetchCrate {
    inherit pname version;
    hash = "wrong hash";
  };

  cargoHash = "wrong hash";

  meta = {
    description = "A cargo extension CLI tool to update your cargo direct dependencies interactively to the latest version";
    homepage = "https://github.com/BenJeau/cargo-interactive-update";
    license = lib.licenses.mit;
    mainProgram = "cargo-interactive-update";
  };
}

# f: p: in overlay stands for final: previous:
# these were previously called self: super: so you may see that notation also
# see: https://nixos.wiki/wiki/Overlays
