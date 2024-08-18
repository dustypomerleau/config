{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
      # Note: language servers are installed via Mason at present
      # 
      # Examples of configuring unpackaged Rust repos:
      # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/rust/cargo-generate/default.nix#L56
      #
      asciidoctor
      awscli2
      bat
      bfg-repo-cleaner
      bottom
      broot # docs: https://dystroy.org/broot/
      cargo-binstall
      cargo-edit
      cargo-expand
      cargo-feature
      cargo-generate
      cargo-leptos
      cargo-make
      # cargo-outdated # temporarily comment this out due to compilation error
      cargo-update
      cargo-watch
      cmake
      curl
      delta
      edgedb
      eza
      fd
      ffmpeg_7
      findutils
      fish # use here instead of programs.enable
      fishPlugins.colored-man-pages
      gawk
      gh
      git
      glow
      gnused
      google-cloud-sdk
      jujutsu
      leptosfmt
      libressl_3_8
      luajitPackages.luarocks
      mas
      neovim
      netlify-cli
      nixd
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_22
      ocrmypdf
      pandoc
      parallel
      pipe-rename
      pnpm
      podman
      pom
      postgresql_16
      prettierd
      python3
      qmk
      ripgrep
      ripgrep-all
      rustup
      sqlx-cli
      stylua
      taplo
      tealdeer
      timer
      tmux # use here instead of programs.enable
      tmuxp # docs: https://tmuxp.git-pull.com/
      tokei
      trash-cli
      typst
      typstfmt
      uutils-coreutils
      wasm-pack
      yazi
      zoxide
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    google-fonts
    nerdfonts
  ];

}
