{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.12.4";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-yYy01aBzbqbTKQH8sfO+hQd1rAIJQnE7YOUv5Jd7+NE=";
  };

  cargoHash = "sha256-o14mhyei1CzHEo5lqRG5SwpSG5qqfVPyOSbe8Y4SUs4=";

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
