{
  lib,
  pkgs,
  fetchCrate,
  rustPlatform,
}:

# /nix/store/w8fw90yrw29xx7hf7bgy6j910pm2c9vx-rimage-0.11.0.drv
rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.11.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-sCDCAuZTpA8qmh5bia03VphuHJ4My4x7lJ4ryEB8VyI=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-tsASNZaRZblzah+FqA8/82WeZ7yDpbokaVs9Mo7mI6w=";
  # tests fail because it can't find the path of the input image files in the nix store
  doCheck = false;

  nativeBuildInputs = with pkgs; [
    cmake
    nasm
    perl
  ];

  meta = {
    description = "A powerful Rust image optimization CLI tool inspired by squoosh!.";
    homepage = "https://github.com/SalOne22/rimage";
    license = lib.licenses.mit;
    mainProgram = "rimage";
  };
}
