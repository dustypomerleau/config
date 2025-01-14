{ inputs, pkgs, ... }:
let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
in
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
      # cargo-semver-checks # temp build failure
      # vscode-extensions.vadimcn.vscode-lldb # temp build failure 2/2 lldb build failure
      any-nix-shell # allows fish in nix-shell
      asciidoctor
      awscli2
      bacon
      basedpyright
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
      cargo-outdated
      cargo-update
      cargo-watch
      clang-tools
      cmake
      curl
      delta
      edgedb
      evcxr
      eza
      fd
      ffmpeg_7
      findutils
      fish
      fishPlugins.colored-man-pages
      fzf
      gawk
      gh
      git
      glow
      gnused
      google-cloud-sdk
      hyperfine
      jujutsu
      kind
      kubectl
      leptosfmt
      libressl_3_8
      lua-language-server
      luajitPackages.luarocks
      markdown-oxide
      mas
      neovim-nightly
      netlify-cli
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_23
      nomino
      ocrmypdf
      pandoc
      parallel
      pipe-rename
      pkg-config
      pnpm
      podman
      pom
      postgresql_16
      prettierd
      prettypst
      python3
      qmk
      ripgrep
      ripgrep-all
      sqlx-cli
      stylua
      svelte-language-server
      tailwindcss-language-server # see below for permissions issue
      taplo
      tealdeer
      tex-fmt
      timer
      tinymist
      tmux
      tmuxp # docs: https://tmuxp.git-pull.com/
      tokei
      trash-cli # trash goes to ~/.local/share/Trash/
      typst
      typstyle
      uutils-coreutils
      vsce
      vscode-langservers-extracted # (markdown, html, css, json, eslint)
      wasm-pack
      yamlfmt
      yazi
      zellij
      zoxide
    ];

    # current install of tailwindcss-language-server is not made executable
    # you ran something similar to sudo uutils-chmod +x /nix/store/<hash>-tailwindcss-language-server-0.0.27/lib/tailwindcss-language-server/packages/tailwindcss-language-server/bin/tailwindcss-language-server
    # but i suspect that won't survive an update

    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    google-fonts
    nerd-fonts.sauce-code-pro
  ];

}

# {
#   lib,
#   rustPlatform,
#   fetchFromGitHub,
# }:
#
# rustPlatform.buildRustPackage rec {
#   pname = "prettypst";
#   version = "unstable-2024-10-20";
#
#   src = fetchFromGitHub {
#     owner = "antonWetzel";
#     repo = "prettypst";
#     rev = "a724b56de0527faf0f1f1eecb17d0b847872411c";
#     hash = "sha256-CVvcrytEG2q6kPiGBMfy/oQCD63Gm2AenvLUhCUx6fw=";
#   };
#
#   cargoHash = "sha256-zUeCthQ2fQ1P0gxN5XXg6a+Op8JFMrzU02Mh0mpwv30=";
#
#   meta = {
#     changelog = "https://github.com/antonWetzel/prettypst/blob/${src.rev}/changelog.md";
#     description = "Formatter for Typst";
#     homepage = "https://github.com/antonWetzel/prettypst";
#     license = lib.licenses.mit;
#     mainProgram = "prettypst";
#     maintainers = with lib.maintainers; [ drupol ];
#   };
# }
