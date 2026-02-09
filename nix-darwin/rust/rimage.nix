{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.12.3";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-I7nOvxRORdZeolBABt5u94Ij0PI/AiLi4wbN+C02haQ=";
  };

  cargoHash = "sha256-kfOzzVkxHDqVrhX6vZF18f9hAXK9SKwezJphH0QGE4E=";

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
