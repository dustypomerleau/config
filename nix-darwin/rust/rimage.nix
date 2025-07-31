{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    tag = "v${version}";
    hash = "sha256-ujoWQcOeX0WpzHHaxEu/39s7LtAqC9QRsrhioLs+few=";
  };

  cargoHash = "sha256-tsASNZaRZblzah+FqA8/82WeZ7yDpbokaVs9Mo7mI6w=";

  nativeBuildInputs = with pkgs; [
    cmake
    nasm
    perl
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
