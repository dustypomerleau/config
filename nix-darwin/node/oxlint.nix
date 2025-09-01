{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.14.0";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    tag = "oxlint_v${version}";
    hash = "sha256-oUdnKvqki3GjOiauRiL6iEHuOhYmK6wm2N7/xAggGrE=";
  };

  cargoHash = "sha256-17W5XHVdXz94LNW33PfFmXOP5bme/kZVcesWT1MZF/4=";

  buildInputs = [
    rust-jemalloc-sys
  ];

  nativeBuildInputs = [ pkgs.cmake ];
  env.OXC_VERSION = version;
  doCheck = false; # snapshot tests fail in nix store

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
