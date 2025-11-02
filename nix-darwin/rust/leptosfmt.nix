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
    # use latest commit on main until a release is shipped
    rev = "8b4194ba33eee417ababdd15498940014fd6d237";
    hash = "sha256-F06Ag99rCn3qZywdxyP7ULOgyhbSzWNe+drBDZJWVxo=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-ihhEeOLNTHi0C8rGIvwiXJRiqIjWGTRRr7JLn6fMtNU=";

  meta = {
    description = "Formatter for the leptos view! macro";
    mainProgram = "leptosfmt";
    homepage = "https://github.com/bram209/leptosfmt";
    license = lib.licenses.mit;
  };
}
