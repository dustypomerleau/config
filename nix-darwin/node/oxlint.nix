{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.11.2";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    tag = "oxlint_v${version}";
    hash = "sha256-Coq2CrbzhLQMupQ1RQMegj3CWqJC8yxdX0Y+hDB3A0g";
  };

  cargoHash = "sha256-Twi55subXIVENIGGkTLHYHYf8lIhi7NGtIbhEuSdb24=";

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
