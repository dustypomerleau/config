{
  fetchCrate,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-interactive-update";
  version = "0.6.2";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-WgN63LavUBNjtIu5O/y7cL2gY5DeROHSxABB/b5rBHU=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-J9j4+JlsTnVXly9Y/cLYZlAWBZaHy9p7oWP0ciRy0Q8=";
  buildInputs = [ pkgs.curl ];

  meta = {
    description = "A cargo extension CLI tool to update your cargo direct dependencies interactively to the latest version";
    homepage = "https://github.com/BenJeau/cargo-interactive-update";
    license = lib.licenses.mit;
    mainProgram = "cargo-interactive-update";
  };
}
