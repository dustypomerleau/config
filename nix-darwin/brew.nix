{ config, ... }:
{
  # note: you may need to `sudo rm -r /usr/local/lib/docker/cli-plugins`
  # see: https://github.com/Homebrew/homebrew-core/issues/45009
  # and: https://stackoverflow.com/questions/72784094/homebrew-error-permission-denied-apply2files-usr-local-lib-docker-cli-pl

  # make sure homebrew packages are available in PATH
  # (given the way fish handles paths, I'm not sure this is necessary)
  environment.systemPath = [ config.homebrew.brewPrefix ];

  homebrew = {
    enable = true;

    # if you want to install HEAD or pass other arguments, you can pass a derivation instead of just a string
    # { name = "neovim"; args = [ "--HEAD" ] }
    # passing only a string is shorthand for { name = ""; }
    brews = [
      # openssl and pkg-config are duplicated here because of issues during Rust builds.
      # This is probably related to the type inference issues in Rust 1.80.0.
      # Try again once these are fixed.
      "netlify-cli"
      "node"
      "openssl"
      "pkg-config"
    ];

    casks = [
      "alacritty"
      "inkscape"
      "karabiner-elements" # pkgs.karabiner-elements is broken
      "mactex"
      "podman-desktop"
      "skim"
      # "affinity-designer"
      # "alfred"
      # "arq"
      # "citrix-workspace"
      # "daisydisk"
      # "discord"
      # "dropbox"
      # "firefox"
      # "google-drive"
      # "microsoft-office"
      # "obsidian"
      # "omnifocus"
      # "papers"
      # "pdf-expert"
      # "signal"
      # "sizzy"
      # "spotify"
      # "transmission"
      # "viscosity"
      # "visual-studio-code"
      # "vivaldi"
      # "vlc"
      # uncomment above for new install (on current system, these conflict with previous installs)
      ## todo: not available from brew: exodus, homerow, openVPN connect
    ];

    caskArgs.require_sha = true;

    masApps = {
      "Apple Configurator" = 1037126344;
      "Mona for Mastodon" = 1659154653;
      "WireGuard" = 1451685025;
      "Xcode" = 497799835;
    };

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap"; # warning: this will delete everything not explicitly installed here
    };

    taps = [ ];
  };
}
