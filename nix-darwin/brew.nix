{ config, ... }:
{
  config = {
    # make sure homebrew packages are available in PATH
    # (given the way fish handles paths, not sure this is necessary)
    environment.systemPath = [ config.homebrew.brewPrefix ];

    homebrew = {
      enable = true;

      # if you want to install HEAD or something, you can pass a derivation instead of just a string
      # { name = "neovim"; args = [ "--HEAD" ] }
      # passing only a string is shorthand for { name = ""; }
      brews = [ ];

      casks = [
        "alacritty"
        "inkscape"
        "karabiner-elements" # pkgs.karabiner-elements is broken
        "mactex"
        "podman-desktop"
        "skim"
        # "alfred"
        # "omnifocus"
        # "pdf-expert"
        # "visual-studio-code"
        # uncomment above for new install (on current system, these conflict with previous installs)
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
        cleanup = "zap";
      };

      taps = [ ];
    };
  };
}
