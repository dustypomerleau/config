# https://librephoenix.com/2023-11-02-how-to-manage-your-dotfiles-the-nix-way-with-home-manager
# https://www.jetpack.io/devbox/docs/guides/using_flakes/
# https://www.breakds.org/post/flake-part-1-packaging/

# available configuration options:
# https://daiderd.com/nix-darwin/manual/

# todo: 
# - [ ] migrate packages from brew to nix
# - [ ] add all casks
# - [ ] add home manager
# - [ ] code splitting
# - [ ] scripts for all defaults write

{
  description = "DP MBP system flake";

  inputs = {
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      computername = "DP MBP";
      hostname = "DP-2018-MBP";
      system = "x86_64-darwin";
      username = "dustinpomerleau";

      configuration =
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
              pkgs.nixd
              pkgs.nixfmt-rfc-style
              pkgs.vim
            ];
          };

          # todo: add any available fonts you use
          fonts.packages = [ ];

          homebrew = {
            enable = true;

            # todo: migrate installed formulas to here
            # if you want to install HEAD or something, you can pass a derivation instead of just a string
            # { name = "neovim"; args = [ "--HEAD" ] }
            # passing only a string is shorthand for { name = ""; }
            brews = [ ];

            # todo: include omnifocus in casks and run casks
            # it's ok to install Karabiner Elements as a cask, but DO NOT enable via programs.enable...
            casks = [ ];

            caskArgs = {
              require_sha = true;
            };

            masApps = {
              "Apple Configurator" = 1037126344;
              "Mona for Mastodon" = 1659154653;
              "WireGuard" = 1451685025;
              "Xcode" = 497799835;
            };

            onActivation = {
              autoUpdate = true;
              upgrade = true;
            };

            taps = [ "edgedb/tap" ];
          };

          networking = {
            dns = [
              # cloudflare
              "2606:4700:4700::1111"
              "2606:4700:4700::1001"
              "1.1.1.1"
              "1.0.0.1"
              # google 
              "2001:4860:4860::8888"
              "2001:4860:4860::8844"
              "8.8.8.8"
              "8.8.4.4"
            ];

            computerName = computername;
            hostName = hostname;

            knownNetworkServices = [
              "Thunderbold Ethernet"
              "Wi-Fi"
            ];

            localHostName = hostname;
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = system;

          programs = {
            fish.enable = true;
            tmux.enable = true;
          };

          security.pam.enableSudoTouchIdAuth = true;

          services = {
            nix-daemon.enable = true;
            # many options in services.postgresql.* left off for now
            tailscale.enable = true;
          };

          system = {
            # The Git revision of the top-level flake from which this configuration was built.
            configurationRevision = self.rev or self.dirtyRev or null;

            defaults = {
              ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;

              NSGlobalDomain = {
                AppleICUForce24HourTime = true;
                AppleInterfaceStyle = "Dark";
                AppleShowAllExtensions = true;
                NSAutomaticCapitalizationEnabled = false;
                NSAutomaticDashSubstitutionEnabled = false;
                NSAutomaticInlinePredictionEnabled = false;
                NSAutomaticPeriodSubstitutionEnabled = false;
                NSAutomaticQuoteSubstitutionEnabled = false;
                NSAutomaticSpellingCorrectionEnabled = false;
                NSNavPanelExpandedStateForSaveMode = true;
                NSNavPanelExpandedStateForSaveMode2 = true;
                PMPrintingExpandedStateForPrint = true;
                PMPrintingExpandedStateForPrint2 = true;
                "com.apple.mouse.tapBehavior" = 1; # tap to click
                "com.apple.sound.beep.feedback" = 0; # feedback when volume is changed
                "com.apple.trackpad.forceClick" = false;
                "com.apple.trackpad.scaling" = 3.0; # 3 is maximum tracking speed

              };

              SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
              WindowManager.StandardHideDesktopIcons = true;
              WindowManager.StandardHideWidgets = true;

              alf.globalstate = 1; # firewall enabled

              dock = {
                autohide = true;
                autohide-delay = 1.0e-2;
                orientation = "left";
                show-recents = false;
                tilesize = 20; # not sure how low this can go...
                wvous-bl-corner = 2; # mission control
                wvous-br-corner = 3; # application windows
              };

              finder = {
                AppleShowAllExtensions = true;
                CreateDesktop = false;
                FXPreferredViewStyle = "clmv"; # column view
                ShowPathbar = true;
                ShowStatusBar = true;
                _FXShowPosixPathInTitle = true;
              };

              loginwindow.GuestEnabled = false;

              menuExtraClock = {
                Show24Hour = true;
                ShowDate = 1;
                ShowDayOfWeek = true;
                ShowSeconds = false;
              };

              screencapture = {
                disable-shadow = true;
                location = "/Users/${username}/Pictures/screenshots/";
              };

              trackpad = {
                ActuationStrength = 0;
                Clicking = true; # enable tap to click
                Dragging = true; # tap to drag (same as drag lock?)
                TrackpadRightClick = true;
                TrackpadThreeFingerDrag = true;
              };

              # universalaccess = {
              #   reduceMotion = true;
              #   reduceTransparency = true;
              # };
            };
            # can system.patches be used to run a script containing defaults write commands that aren't covered here?
          };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#DP-2018-MBP
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem { modules = [ configuration ]; };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
    };
}
