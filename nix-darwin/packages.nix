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

  gel = rustPlatform.buildRustPackage rec {
    pname = "gel-cli";
    version = "7.0.3";

    src = fetchFromGitHub {
      inherit pname version;
      owner = "geldata";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-DFra+gUvS+vofGNX270JqoGItDXDM3KNIrNezNRUqMg=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-s8UKYZs4GorM0qvAvE+HL+Qma2x05IDtuqYebMDrZHk=";
    nativeBuildInputs = [ pkgs.perl ];
    # `tests/func`requires the `gel-server binary in $PATH`
    doCheck = false;

    meta = {
      description = "This repository contains the implementation of gel command-line tool.";
      homepage = src.url;
      license = lib.licenses.mit;
      mainProgram = "gel";
    };
  };

  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  rimage = rustPlatform.buildRustPackage rec {
    pname = "rimage";
    version = "0.11.0-next.3";

    src = fetchCrate {
      inherit pname version;
      hash = "sha256-lss5JDpDvZ7M4VNBsQYLOHO1cy7OYKsgYoh/nzYMN3w=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-r/xAoqyl1wn0CcgjrXolsPb4hvlviGmqLTc5w74C584=";
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
      cargo-outdated
      cargo-semver-checks
      cargo-update
      cargo-watch
      clang-tools
      cmake
      curl
      delta
      edgedb # todo: replace with gel upon release
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
      rimage
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
      vscode-extensions.vadimcn.vscode-lldb
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
    nerd-fonts.commit-mono
    nerd-fonts.sauce-code-pro
  ];

}
