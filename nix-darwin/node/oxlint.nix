{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.10.0";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    tag = "oxlint_v${version}";
    hash = "sha256-e6NriG/l8WEjTfMfI7o3etFR7hi1GWi8JXXU+GW4hK0=";
  };

  cargoHash = "sha256-9AA6b7tXJosGLfslRLdeRHEarbig1bSBSoy4y1mNqjA=";

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
