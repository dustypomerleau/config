#s NOTE: you can find the installed path for a package with:
# nix-instantiate --eval-only --expr '(import <nixpkgs> {}).<package-name>.outPath'

{
  # inputs,
  pkgs,
  ...
}:

# let
#   neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
# in
{
  imports = [ ./rust ];

  environment = {
    # files to link into /etc
    # For example, do you need to manually include /etc/ssh/ssh_config.d/100-linux-builder.conf ?
    #
    # You can either include a source file:
    # environment.etc.<name>.source
    #
    # or the file text directly
    # environment.etc.<name>.text
    #
    # etc = {};

    shells = with pkgs; [
      zsh
      fish
    ];

    # `environment.systemPackages` are installed for all users (unlike `home.packages`)
    systemPackages = with pkgs; [
      _1password-cli # unfree
      any-nix-shell # allows fish in nix-shell
      asciidoctor
      awscli2
      bacon
      bat
      bfg-repo-cleaner
      binaryen
      bottom
      broot # docs: https://dystroy.org/broot/
      btop
      cargo-binstall
      cargo-edit
      cargo-expand
      cargo-feature
      cargo-generate
      cargo-insta
      cargo-make
      cargo-nextest
      cargo-outdated
      cargo-semver-checks
      cargo-update
      cargo-watch
      clang-tools
      claude-code
      cmake
      curl
      delta
      dockerfmt
      emmet-language-server
      eza
      fastfetch
      fd
      ffmpeg
      findutils
      fish
      # fishPlugins.colored-man-pages # don't duplicate this
      fzf
      gawk
      gemini-cli
      gh
      git
      git-filter-repo
      glow
      gnused
      google-cloud-sdk
      hyperfine
      jj-starship
      jujutsu
      kind
      kubectl
      libressl
      luajit
      lua-language-server
      luajitPackages.luacheck
      luajitPackages.luarocks
      markdown-oxide
      mas
      neovim
      # neovim-nightly # use stable
      netlify-cli
      nil
      nix-init
      nix-update
      nixfmt
      nodePackages.svgo
      nodejs_24
      nomino
      nurl
      ocrmypdf
      opentofu
      ouch
      pandoc
      parallel
      pipe-rename
      pkg-config
      pnpm
      podman
      pom
      postgres-language-server
      prettypst
      python3
      qemu
      qmk
      railway
      ripgrep
      ripgrep-all
      ruff
      sqlite
      sqlx-cli
      sqruff
      starship
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
      # tmuxp # docs: https://tmuxp.git-pull.com/
      tofu-ls
      tokei
      trash-cli # trash goes to ~/.local/share/Trash/
      tree-sitter
      ty
      typst
      typstyle
      unrar # unfree
      uutils-coreutils
      uv
      vsce
      vscode-extensions.vadimcn.vscode-lldb
      vscode-langservers-extracted # (markdown, html, css, json, eslint)
      vtsls
      wasm-pack
      yamlfmt
      # yt-dlp
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
