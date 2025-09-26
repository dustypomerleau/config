# This likely won't work until you follow instructions like in the 'find and move the binary' section here:
# https://github.com/render-oss/cli/blob/main/bin/install.sh

{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "render-cli";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "render-oss";
    repo = "cli";
    tag = "v${version}";
    hash = "sha256-dDNSc2o3Hfjq70ZM9ikTYKt1UHx5ut8S2snJE0hLlQc=";
  };

  vendorHash = "sha256-BExwkK0EKR0Mtk+bphPD3/4iyAnj942gkGWWTYUIceU=";

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  cargoBuildFlags = [ "--bin=render" ];

  doCheck = false; # e2e testing fails

  meta = {
    description = "The Official Render CLI";
    homepage = "https://github.com/render-oss/cli";
    license = lib.licenses.asl20;
    mainProgram = "render";
  };
}
