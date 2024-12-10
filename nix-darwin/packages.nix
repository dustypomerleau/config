{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
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
      cargo-feature
      cargo-generate
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
      prettypst
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

    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    google-fonts
    nerd-fonts.sauce-code-pro
  ];

}
