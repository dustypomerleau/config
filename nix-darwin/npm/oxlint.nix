{
  lib,
  rustPlatform,
  fetchFromGitHub,
  rust-jemalloc-sys,
}:

rustPlatform.buildRustPackage rec {
  pname = "oxlint";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "oxc-project";
    repo = "oxc";
    rev = "oxlint_v${version}";
    hash = "sha256-ub8Ylobolp+0Uq5l0abj/2VKbgR79txPAZeXHx05nhw=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-t14ybw/GTlCqb4LCcQJS/p+Tr934ztvsRfga/S3kjeY=";

  buildInputs = [
    rust-jemalloc-sys
  ];

  env.OXC_VERSION = version;

  cargoBuildFlags = [
    "--bin=oxlint"
    "--bin=oxc_language_server"
  ];
  cargoTestFlags = cargoBuildFlags;

  meta = with lib; {
    description = "Suite of high-performance tools for JavaScript and TypeScript written in Rust";
    homepage = "https://github.com/web-infra-dev/oxc";
    changelog = "https://github.com/web-infra-dev/oxc/releases/tag/${src.rev}";
    license = licenses.mit;
    maintainers = with maintainers; [ figsoda ];
    mainProgram = "oxlint";
  };
}
