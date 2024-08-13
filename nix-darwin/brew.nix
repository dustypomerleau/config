{ config, ... }:
{
  config = {
    # make sure homebrew packages are available in PATH
    # given the way fish handles paths, not sure this is necessary
    environment.systemPath = [ config.homebrew.brewPrefix ];

    homebrew = {
      enable = true;

      # if you want to install HEAD or something, you can pass a derivation instead of just a string
      # { name = "neovim"; args = [ "--HEAD" ] }
      # passing only a string is shorthand for { name = ""; }
      brews = [ ];

      # todo: include omnifocus in casks and run casks - try to find the apps in nix first, then fall back to casks
      # many of these you won't need anymore
      # don't switch on zap until you've finished these
      # 
      # omnifocus
      # alacritty
      # anki
      # devpod
      # docker
      # fig
      # font-hack-nerd-font
      # font-jetbrains-mono-nerd-font
      # font-martian-mono
      # font-martian-mono-nerd-font
      # font-monaspace-nerd-font
      # font-sauce-code-pro-nerd-font
      # font-space-mono-nerd-font
      # google-cloud-sdk
      # inkscape
      # karabiner-elements it's ok to install Karabiner Elements as a cask, but DO NOT enable via programs.enable...
      # kdiff3
      # kindle
      # meld
      # podman-desktop
      # rar
      # skim
      # mactex
      # texmaker
      casks = [ ];

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
