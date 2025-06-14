{
  pkgs,
  ...
}:

let
  inherit (pkgs) callPackage;

  cargo-interactive-update = callPackage ./crates/cargo-interactive-update.nix { };
  leptosfmt = callPackage ./crates/leptosfmt.nix { };
  # neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  oxlint_1 = callPackage ./npm/oxlint.nix { };
  rimage = callPackage ./crates/rimage.nix { };
in
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # `environment.systemPackages` are installed for all users (unlike `home.packages`)
    systemPackages = with pkgs; [
      # neovim-nightly # use stable due to treesitter rust issues
      # oxlint
      # unrar # unfree, uncomment this and nixpgks.config.allowUnfree in core.nix if needed
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
      neovim
      netlify-cli
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_24
      nomino
      ocrmypdf
      opentofu
      oxlint_1
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
      tesseract
      tex-fmt
      texlab
      timer
      tinymist
      tmux
      tmuxp # docs: https://tmuxp.git-pull.com/
      tofu-ls
      tokei
      trash-cli # trash goes to ~/.local/share/Trash/
      tree-sitter
      typst
      typstyle
      uutils-coreutils
      vsce
      vscode-extensions.vadimcn.vscode-lldb
      vscode-langservers-extracted # (markdown, html, css, json, eslint)
      vtsls
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
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
    nerd-fonts.sauce-code-pro
  ];

}
