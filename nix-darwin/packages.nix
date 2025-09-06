# note: you can find the installed path for a package with:
# nix-instantiate --eval-only --expr '(import <nixpkgs> {}).<package-name>.outPath'

{
  inputs,
  pkgs,
  ...
}:

let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
in
{
  imports = [
    ./node
    # ./python # remove for now, as kaleido is no longer needed
    ./rust
  ];

  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # `environment.systemPackages` are installed for all users (unlike `home.packages`)
    systemPackages = with pkgs; [
      # podman # build failure @ 5.6.0 2/2 test
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
      cargo-insta
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
      libressl
      lua-language-server
      luajitPackages.luacheck
      luajitPackages.luarocks
      markdown-oxide
      mas
      # neovim
      neovim-nightly
      netlify-cli
      nil
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_24
      nomino
      ocrmypdf
      opentofu
      pandoc
      parallel
      pipe-rename
      pkg-config
      pnpm
      pom
      postgresql_16
      prettypst
      qmk
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
