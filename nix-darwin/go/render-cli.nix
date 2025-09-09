{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "render-cli";
  version = "2.1.5";

  src = fetchFromGitHub {
    owner = "render-oss";
    repo = "cli";
    tag = "v${version}";
    hash = "sha256-SvWU88VwTLYUmVfG5/qs7jazIX7hjV4x+6ZT/7ZBKuQ=";
  };

  vendorHash = "sha256-BExwkK0EKR0Mtk+bphPD3/4iyAnj942gkGWWTYUIceU=";

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  doCheck = false; # e2e testing fails

  meta = {
    description = "The Official Render CLI";
    homepage = "https://github.com/render-oss/cli";
    license = lib.licenses.asl20;
    mainProgram = "render";
  };
}
