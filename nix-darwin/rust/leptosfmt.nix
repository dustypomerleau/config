# nixpkgs-unstable is stuck on 0.1.30
{
  fetchFromGitHub,
  rustPlatform,
  lib,
}:

rustPlatform.buildRustPackage rec {
  pname = "leptosfmt";
  version = "0.1.33";

  src = fetchFromGitHub {
    owner = "bram209";
    repo = pname;
    rev = version;
    hash = "sha256-+trLQFU8oP45xHQ3DsEESQzQX2WpvQcfpgGC9o5ITcY=";
    fetchSubmodules = true;
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-m9426zuxp9GfbYoljW49BVgetLTqqcqGHCb7I+Yw+bc=";

  meta = {
    description = "Formatter for the leptos view! macro";
    mainProgram = "leptosfmt";
    homepage = "https://github.com/bram209/leptosfmt";
    license = lib.licenses.mit;
  };
}
