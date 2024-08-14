{ pkgs, ... }:
{
  environment = {
    shells = [
      pkgs.zsh
      pkgs.fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = [
      ## todo: not available from cargo: crates-tui, rimage
      pkgs.asciidoctor
      pkgs.awscli2
      pkgs.bat
      pkgs.bfg-repo-cleaner
      pkgs.bottom
      pkgs.broot # docs: https://dystroy.org/broot/
      pkgs.cargo-binstall
      pkgs.cargo-edit
      pkgs.cargo-expand
      pkgs.cargo-feature
      pkgs.cargo-generate
      pkgs.cargo-leptos
      pkgs.cargo-make
      pkgs.cargo-outdated
      pkgs.cargo-update
      pkgs.cargo-watch
      pkgs.cmake
      pkgs.curl
      pkgs.delta
      pkgs.edgedb
      pkgs.eza
      pkgs.fd
      pkgs.ffmpeg_7
      pkgs.findutils
      pkgs.fishPlugins.colored-man-pages
      pkgs.gawk
      pkgs.gh
      pkgs.git
      pkgs.glow
      pkgs.gnused
      pkgs.google-cloud-sdk
      pkgs.jujutsu
      pkgs.leptosfmt
      pkgs.luajitPackages.luarocks
      pkgs.mas
      pkgs.neovim
      pkgs.netlify-cli
      pkgs.nixd
      pkgs.nixfmt-rfc-style
      pkgs.nodePackages.svgo
      pkgs.nodejs_22
      pkgs.ocrmypdf
      pkgs.pandoc
      pkgs.parallel
      pkgs.pipe-rename
      pkgs.pnpm
      pkgs.podman
      pkgs.pom
      pkgs.postgresql_16
      pkgs.prettierd
      pkgs.python3
      pkgs.qmk
      pkgs.ripgrep
      pkgs.ripgrep-all
      pkgs.rustup
      pkgs.sqlx-cli
      pkgs.stylua
      pkgs.taplo
      pkgs.tealdeer
      pkgs.timer
      pkgs.tmuxp # docs: https://tmuxp.git-pull.com/
      pkgs.tokei
      pkgs.trash-cli
      pkgs.typst
      pkgs.typstfmt
      pkgs.uutils-coreutils
      pkgs.wasm-pack
      pkgs.zoxide
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = [
    pkgs.barlow
    pkgs.nerdfonts
    pkgs.open-sans
  ];

}
