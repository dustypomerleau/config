# todo: nixify cargo-install packages
# for example: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md
# and: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/rust/cargo-generate/default.nix#L56

{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      zsh
      fish
    ];

    # installed for all users, unlike `home.packages`
    systemPackages = with pkgs; [
      # todo: possibly migrate language servers to here from mason
      # ✓ basedpyright
      # ✓ clangd
      # ✓ codelldb
      # ✓ css-lsp cssls
      # ✓ html-lsp html
      # ✓ lua-language-server lua_ls
      # ✓ marksman
      # ✓ rust-analyzer
      # ✓ sqlfmt
      # ✓ svelte-language-server svelte
      # ✓ tailwindcss-language-server tailwindcss
      # ✓ taplo
      # ✓ typescript-language-server tsserver
      # ✓ typst-lsp typst_lsp
      # ✓ vtsls
      asciidoctor
      awscli2
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
      # cargo-outdated # temporarily comment this out due to compilation error
      cargo-update
      cargo-watch
      cmake
      curl
      delta
      edgedb
      eza
      fd
      ffmpeg_7
      findutils
      fishPlugins.colored-man-pages
      gawk
      gh
      git
      glow
      gnused
      google-cloud-sdk
      jujutsu
      leptosfmt
      luajitPackages.luarocks
      mas
      neovim
      netlify-cli
      nixd
      nixfmt-rfc-style
      nodePackages.svgo
      nodejs_22
      ocrmypdf
      pandoc
      parallel
      pipe-rename
      pnpm
      podman
      pom
      postgresql_16
      prettierd
      python3
      qmk
      ripgrep
      ripgrep-all
      rustup
      sqlx-cli
      stylua
      taplo
      tealdeer
      timer
      tmuxp # docs: https://tmuxp.git-pull.com/
      tokei
      trash-cli
      typst
      typstfmt
      uutils-coreutils
      wasm-pack
      yazi
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
