{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    tag = "oxlint_v${version}";
    hash = "sha256-7EcXsS600kINm/KB8tTMt0z9eQMyJmisnn/fsCS/2qk=";
  };

  cargoHash = "sha256-FwHknur1hkuOy6EkSGoePtMOvckgV56C3ZnPl2RNilM=";

  buildInputs = [
    rust-jemalloc-sys
  ];

  nativeBuildInputs = [ pkgs.cmake ];

  env.OXC_VERSION = version;

  cargoBuildFlags = [
    "--bin=oxlint"
    "--bin=oxc_language_server"
  ];

  cargoTestFlags = cargoBuildFlags;

  meta = {
    description = "Collection of JavaScript tools written in Rust";
    homepage = "https://github.com/oxc-project/oxc";
    changelog = "https://github.com/oxc-project/oxc/releases/tag/${src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ figsoda ];
    mainProgram = "oxlint";
  };
}
