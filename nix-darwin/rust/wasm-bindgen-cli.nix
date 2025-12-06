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
  version = "0.2.106";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-M6WuGl7EruNopHZbqBpucu4RWz44/MSdv6f0zkYw+44=";
  };

  cargoHash = "sha256-ElDatyOwdKwHg3bNH/1pcxKI7LXkhsotlDPQjiLHBwA=";

  buildInputs = [ openssl ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ curl ];
  nativeBuildInputs = [ pkg-config ];

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
