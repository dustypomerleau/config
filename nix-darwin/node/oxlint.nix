{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.11.1";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    tag = "oxlint_v${version}";
    hash = "sha256-S3a2wF6UGPzm2DnC6oCWr57SpgVuj/ubWNePqWhdpdc=";
  };

  cargoHash = "sha256-YvgFY2CSLbaamwOkFaGbI2jx6zP52c3IGn5/QQ9j5Zo=";

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
