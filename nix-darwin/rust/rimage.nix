{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.12.2";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-8TwkChwUV7+scu0Ibx4A96579SiFii36hUMbDDT0Guc=";
  };

  cargoHash = "sha256-j31YMR1KcNrWP0hCtePWupuqtelGb7FQZNu3ZcOCoq8=";

  nativeBuildInputs = with pkgs; [
    cmake
    nasm
    perl
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
