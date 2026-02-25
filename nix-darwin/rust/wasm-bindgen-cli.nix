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
  version = "0.2.113";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-CWxeRhlO1i4Yq93OVLFDvJFIaBB7q2Ps0yqk+Euz+8w=";
  };

  cargoHash = "sha256-XmIx55PKfu+tVUGFC7MGF4AAYeV7z/p3KuLnY0bYMH8=";

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
