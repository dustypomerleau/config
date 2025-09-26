{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.12.1";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-RkdT4XAEtZunvupgAyndewOsTkdP/W1+Vn81Qc9yJ24=";
  };

  cargoHash = "sha256-cdYo93i1wrb70Jlue0flGrYu+z0CrAVs+UhoelsCU6Q=";

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
    description = "A powerful Rust image optimization CLI tool inspired by squoosh!";
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
