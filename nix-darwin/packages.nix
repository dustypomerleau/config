#s NOTE: you can find the installed path for a package with:
# nix-instantiate --eval-only --expr '(import <nixpkgs> {}).<package-name>.outPath'

{
  inputs,
  pkgs,
  ...
}:

# let
#   neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
# in
{
  imports = [ ./rust ];

  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # `environment.systemPackages` are installed for all users (unlike `home.packages`)
    systemPackages = with pkgs; [
      # cargo-semver-checks # build failure
      # cargo-update # build failure
      # unrar # unfree, uncomment this and nixpgks.config.allowUnfree in core.nix if needed
      # neovim-nightly
      any-nix-shell # allows fish in nix-shell
      asciidoctor
      awscli2
      bacon
      bat
      bfg-repo-cleaner
      binaryen
      bottom
      broot # docs: https://dystroy.org/broot/
      cargo-binstall
      cargo-edit
      cargo-expand
      cargo-feature
      cargo-generate
      cargo-insta
      cargo-make
      cargo-nextest # waiting on https://github.com/NixOS/nixpkgs/pull/456256
      cargo-outdated
      cargo-watch
      clang-tools
      cmake
      curl
      delta
      dockerfmt
      emmet-language-server
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
      neovim
      netlify-cli
      nil
      nix-update
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
      podman
      pom
      postgresql_16
      prettypst
      qmk
      railway
      ripgrep
      ripgrep-all
      ruff
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
      ty
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
