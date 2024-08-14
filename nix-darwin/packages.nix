{ pkgs, ... }:
{
  environment = {
    shells = [
      pkgs.zsh
      pkgs.fish
    ];

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | rg <name>
    # systemPackages are installed for all users, unlike profile packages
    systemPackages = [
      pkgs.alacritty
      # pkgs.tmux # already enabled in core.nix
      pkgs.asciidoctor
      pkgs.awscli2
      pkgs.bat
      pkgs.bfg-repo-cleaner
      pkgs.bottom
      pkgs.broot # docs: https://dystroy.org/broot/
      pkgs.cmake
      pkgs.curl
      pkgs.delta
      pkgs.edgedb
      pkgs.eza
      pkgs.fd
      pkgs.ffmpeg_7
      pkgs.findutils
      pkgs.gawk
      pkgs.gh
      pkgs.git
      pkgs.glow
      pkgs.gnused
      pkgs.google-cloud-sdk
      pkgs.inkscape
      pkgs.luajitPackages.luarocks
      pkgs.mas
      pkgs.neovim
      pkgs.nixd
      pkgs.nixfmt-rfc-style
      pkgs.nodejs_22
      pkgs.ocrmypdf
      pkgs.pandoc
      pkgs.parallel
      pkgs.pnpm
      pkgs.podman
      pkgs.pom
      pkgs.postgresql_16
      pkgs.python3
      pkgs.qmk
      pkgs.ripgrep
      pkgs.ripgrep-all
      pkgs.rustup
      pkgs.skimpdf
      pkgs.taplo
      pkgs.tealdeer
      pkgs.timer
      pkgs.tmuxp # docs: https://tmuxp.git-pull.com/
      pkgs.tokei
      pkgs.typst
      pkgs.typstfmt
      pkgs.uutils-coreutils
      pkgs.zoxide
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  # todo: add any available fonts you use
  fonts.packages = [ pkgs.nerdfonts ];

}
