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
      # todo: add remaining packages
      pkgs.asciidoctor
      pkgs.awscli2
      pkgs.bat
      pkgs.bfg-repo-cleaner
      pkgs.bottom
      pkgs.broot # docs: https://dystroy.org/broot/
      pkgs.cloc
      pkgs.cmake
      pkgs.curl
      pkgs.edgedb
      pkgs.eza
      pkgs.gawk
      pkgs.nixd
      pkgs.nixfmt-rfc-style
      pkgs.vim
      pkgs.fd
      pkgs.ffmpeg_7
      pkgs.findutils
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  # todo: add any available fonts you use
  fonts.packages = [ ];

}

# packages to migrate from brew:
# 
# fzf
# gdb
# gh
# git
# git-delta
# glow
# gnu-sed
# grep
# haskell-stack
# helix
# idris
# idris2
# jq
# libpq
# librsvg
# libzip
# luarocks
# mas
# mysql
# nasm
# neovim
# node
# ocrmypdf
# pandoc
# parallel
# pnpm
# podman
# postgresql@11
# postgresql@13
# postgresql@14
# python@3.8
# qmk/qmk/qmk
# r
# ripgrep-all
# rlue/utils/timer
# rust-parallel
# rustup
# showkey
# taplo
# tealdeer
# tere
# tmux
# tokei
# tree
# typst
# uutils-coreutils
# watchman
# yarn
# youtube-dl
# zola
# zoxide
# zsh
# zsh-syntax-highlighting
