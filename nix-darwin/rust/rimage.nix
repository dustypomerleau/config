{
  cmake,
  dav1d,
  fetchFromGitHub,
  lib,
  nasm,
  perl,
  pkg-config,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-oWJIynOgwoA+8pFTCOo3M4mMNqBpFLRd4jVYlyOfFwk=";
  };

  cargoHash = "sha256-0yBoznm0TgT7cXaJHkvRfe8pWcM3KcZXcYCcbtp9T48=";

  nativeBuildInputs = [
    cmake
    nasm
    perl
    pkg-config
  ];

  buildInputs = [
    dav1d
  ];

  cargoBuildFlags = [ "--bin=rimage" ];

  buildFeatures = [
    "build-binary"
    "icc"
  ];

  meta = {
    description = "a powerful Rust image optimization CLI tool inspired by squoosh!";
    homepage = "https://github.com/SalOne22/rimage";
    changelog = "https://github.com/SalOne22/rimage/releases/tag/${src.tag}";

    license = with lib.licenses; [
      asl20
      mit
    ];

    maintainers = with lib.maintainers; [ dustypomerleau ];
    mainProgram = "rimage";
  };
}
