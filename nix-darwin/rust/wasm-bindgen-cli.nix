{
  curl,
  fetchCrate,
  lib,
  nodejs_latest,
  openssl,
  pkg-config,
  rustPlatform,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "wasm-bindgen-cli";
  version = "0.2.105";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-zLPFFgnqAWq5R2KkaTGAYqVQswfBEYm9x3OPjx8DJRY=";
  };

  cargoHash = "sha256-a2X9bzwnMWNt0fTf30qAiJ4noal/ET1jEtf5fBFj5OU=";

  buildInputs = [ openssl ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ curl ];
  nativeBuildInputs = [ pkg-config ];
  nativeCheckInputs = [ nodejs_latest ];

  # tests require it to be run in the wasm-bindgen monorepo
  doCheck = false;

  meta = {
    homepage = "https://wasm-bindgen.github.io/wasm-bindgen/";

    license = with lib.licenses; [
      asl20
      mit
    ];

    description = "Facilitating high-level interactions between wasm modules and JavaScript";

    maintainers = with lib.maintainers; [
      rizary
      insipx
    ];

    mainProgram = "wasm-bindgen";
  };
}
