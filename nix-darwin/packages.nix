{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
      any-nix-shell # allows fish in nix-shell
      asciidoctor
      awscli2
      basedpyright
      bat
      bfg-repo-cleaner
      bottom
      broot # docs: https://dystroy.org/broot/
      cargo-binstall
      cargo-edit
      cargo-expand
      # cargo-feature # build failure
      cargo-generate
      cargo-leptos
      cargo-make
      # cargo-outdated # build failure, move to brew: https://github.com/kbknapp/cargo-outdated/pull/393
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
      jujutsu
      kind
      kubectl
      leptosfmt
      libressl_3_8
      luajitPackages.luarocks
      lua-language-server
      markdown-oxide
      mas
      neovim
      # netlify-cli # too old, move to brew
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      # nodejs_22 # build failure, move to brew
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
      python3
      qmk
      ripgrep
      ripgrep-all
      # rustup # remove due to fenix collisions
      sqlx-cli
      stylua
      svelte-language-server
      tailwindcss-language-server
      taplo
      tealdeer
      timer
      tmux
      tmuxp # docs: https://tmuxp.git-pull.com/
      tokei
      trash-cli
      typst
      typstfmt
      typst-lsp
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
    nerdfonts
  ];

}
