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
        "karabiner-elements" # pkgs.karabiner-elements is broken
        "mactex"
        "omnifocus"
        "podman-desktop"
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
        # uncomment below only once you have all homebrew packages in nix
        # cleanup = "zap";
      };

      taps = [ ];
    };
  };
}
