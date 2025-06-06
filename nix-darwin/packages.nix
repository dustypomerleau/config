# note: mold breakage on darwin comes from this commit:
# https://github.com/NixOS/nixpkgs/commit/59a57736847d941843bc210ca48885b2f771462f
# from pull:
# https://github.com/NixOS/nixpkgs/pull/406936
{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  # todo: split out to `crates/`
  inherit (pkgs)
    fetchCrate
    fetchFromGitHub
    rustPlatform
    ;

  cargo-interactive-update = rustPlatform.buildRustPackage rec {
    pname = "cargo-interactive-update";
    version = "0.6.2";

    src = fetchCrate {
      inherit pname version;
      hash = "sha256-WgN63LavUBNjtIu5O/y7cL2gY5DeROHSxABB/b5rBHU=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-J9j4+JlsTnVXly9Y/cLYZlAWBZaHy9p7oWP0ciRy0Q8=";
    buildInputs = [ pkgs.curl ];

    meta = {
      description = "A cargo extension CLI tool to update your cargo direct dependencies interactively to the latest version";
      homepage = "https://github.com/BenJeau/cargo-interactive-update";
      license = lib.licenses.mit;
      mainProgram = "cargo-interactive-update";
    };
  };

  # nixpkgs-unstable is stuck on 0.1.30
  leptosfmt = rustPlatform.buildRustPackage rec {
    pname = "leptosfmt";
    version = "0.1.33";

    src = fetchFromGitHub {
      owner = "bram209";
      repo = pname;
      rev = version;
      hash = "sha256-+trLQFU8oP45xHQ3DsEESQzQX2WpvQcfpgGC9o5ITcY=";
      fetchSubmodules = true;
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-m9426zuxp9GfbYoljW49BVgetLTqqcqGHCb7I+Yw+bc=";

    meta = {
      description = "Formatter for the leptos view! macro";
      mainProgram = "leptosfmt";
      homepage = "https://github.com/bram209/leptosfmt";
      license = lib.licenses.mit;
    };
  };

  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  # /nix/store/w8fw90yrw29xx7hf7bgy6j910pm2c9vx-rimage-0.11.0.drv
  rimage = rustPlatform.buildRustPackage rec {
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
  };
in
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # `environment.systemPackages` are installed for all users (unlike `home.packages`)
    systemPackages = with pkgs; [
      # unrar # unfree, uncomment this and nixpgks.config.allowUnfree in core.nix if needed
      any-nix-shell # allows fish in nix-shell
      asciidoctor
      awscli2
      bacon
      basedpyright # temp build failure, fixed in https://github.com/NixOS/nixpkgs/pull/371176
      bat
      bfg-repo-cleaner
      bottom
      broot # docs: https://dystroy.org/broot/
      cargo-binstall
      cargo-edit
      cargo-expand
      cargo-feature
      cargo-generate
      cargo-interactive-update
      cargo-leptos
      cargo-make
      cargo-nextest
      cargo-outdated
      cargo-semver-checks
      cargo-update
      cargo-watch
      clang-tools
      cmake
      curl
      delta
      evcxr
      eza
      fd
      ffmpeg_7
      findutils
      fish
      fishPlugins.colored-man-pages
      fzf
      gawk
      gel
      gh
      git
      git-filter-repo
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
      luajitPackages.luacheck
      luajitPackages.luarocks
      markdown-oxide
      mas
      neovim-nightly
      netlify-cli
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_24
      nomino
      ocrmypdf
      opentofu
      opentofu-ls
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
      rimage
      ripgrep
      ripgrep-all
      sqlx-cli
      stylua
      svelte-language-server
      taplo
      tealdeer
      terraform-ls # replace with https://github.com/opentofu/tofu-ls/ when it comes out of alpha
      tesseract
      tex-fmt
      texlab
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
      vscode-extensions.vadimcn.vscode-lldb
      vscode-langservers-extracted # (markdown, html, css, json, eslint)
      wasm-pack
      yamlfmt
      yazi
      zellij
      zoxide
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    google-fonts
    nerd-fonts.commit-mono
    nerd-fonts.sauce-code-pro
    maple-mono.NF
  ];

}
