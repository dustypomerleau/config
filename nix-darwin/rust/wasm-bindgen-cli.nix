{
  curl,
  fetchCrate,
  lib,
  openssl,
  pkg-config,
  rustPlatform,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "wasm-bindgen-cli";
  version = "0.2.117";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-vtDQXL8FSgdutqXG7/rBUWgrYCtzdmeVQQkWkjasvZU=";
  };

  cargoHash = "sha256-eKe7uwneUYxejSbG/1hKqg6bSmtL0KQ9ojlazeqTi88=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ curl ];

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
