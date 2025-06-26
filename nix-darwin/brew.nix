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
    brews = [ ];

    casks = [
      "1password"
      "affinity-designer"
      "alacritty"
      "alfred"
      "arq"
      "citrix-workspace"
      "daisydisk"
      "discord"
      "dropbox"
      "element"
      "figma"
      "firefox"
      "google-chrome"
      "google-drive"
      "inkscape"
      "insomnia"
      "karabiner-elements" # pkgs.karabiner-elements is broken
      "mactex-no-gui"
      "microsoft-office"
      "obsidian"
      "omnifocus"
      "papers"
      "pdf-expert"
      "podman-desktop"
      "polypane"
      "signal"
      "skim"
      "spotify"
      "transmission"
      "viscosity"
      "visual-studio-code"
      "vivaldi"
      "vlc"
      # todo: not available from brew: exodus, homerow, openVPN connect
    ];

    caskArgs.require_sha = false;

    # disable temporarily due to: https://github.com/mas-cli/mas/issues/724
    masApps = {
      "Apple Configurator" = 1037126344;
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
