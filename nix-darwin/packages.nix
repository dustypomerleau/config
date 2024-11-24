{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
      # cargo-feature # build failure
      # cargo-outdated # build failure, move to brew: https://github.com/kbknapp/cargo-outdated/pull/393
      # rustup # remove due to fenix collisions
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
      cargo-generate
      cargo-leptos
      cargo-make
      cargo-semver-checks
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
      neovim
      netlify-cli
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_23
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
      trash-cli # trash goes to ~/.local/share/Trash/
      typst
      typst-lsp
      typstfmt
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
