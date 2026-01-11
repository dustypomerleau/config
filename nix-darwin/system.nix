{ specialArgs, ... }:
{
  networking = {
    applicationFirewall.enable = true;

    # removing DNS config until separate locations can be configured
    # dns = [
    #   # cloudflare
    #   "2606:4700:4700::1111"
    #   "2606:4700:4700::1001"
    #   "1.1.1.1"
    #   "1.0.0.1"
    #   # google
    #   "2001:4860:4860::8888"
    #   "2001:4860:4860::8844"
    #   "8.8.8.8"
    #   "8.8.4.4"
    # ];

    computerName = specialArgs.computername;
    hostName = specialArgs.hostname;

    knownNetworkServices = [
      "Thunderbolt Bridge"
      "Wi-Fi"
    ];

    localHostName = specialArgs.hostname;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;

      CustomSystemPreferences = {
        "com.apple.CrashReporter" = {
          UseUnc = 1;
        };

        "com.apple.finder" = {
          QLEnableTextSelection = true;
        };

        "com.apple.notificationcenterui" = {
          bannerTime = 10;
        };

        # TODO: PR this, it goes in modules/system/defaults/NSGlobalDomain.nix below trackpad.scaling
        NSGlobalDomain = {
          "com.apple.trackpad.scrolling" = 0.5; # 1 is maximum
        };
      };

      CustomUserPreferences = { };

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

      dock = {
        autohide = true;
        autohide-delay = 1.0e-2;
        orientation = "left";
        show-recents = false;
        showAppExposeGestureEnabled = true;
        showDesktopGestureEnabled = false;
        showLaunchpadGestureEnabled = false;
        showMissionControlGestureEnabled = true;
        tilesize = 20;
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
        location = "/Users/${specialArgs.username}/Pictures/screenshots/";
      };

      trackpad = {
        ActuateDetents = false;
        ActuationStrength = 0;
        Clicking = true; # enable tap to click
        DragLock = true;
        Dragging = true; # tap to drag (not the same as DragLock)
        FirstClickThreshold = 0;
        ForceSuppressed = true;
        SecondClickThreshold = 0;
        TrackpadCornerSecondaryClick = 0;
        TrackpadFourFingerHorizSwipeGesture = 0;
        TrackpadFourFingerPinchGesture = 0;
        TrackpadFourFingerVertSwipeGesture = 0;
        TrackpadMomentumScroll = true;
        TrackpadPinch = true;
        TrackpadRightClick = true;
        TrackpadRotate = true;
        TrackpadThreeFingerDrag = true;
        TrackpadThreeFingerHorizSwipeGesture = 0;
        TrackpadThreeFingerTapGesture = 2;
        TrackpadThreeFingerVertSwipeGesture = 0;
        TrackpadTwoFingerDoubleTapGesture = true;
        TrackpadTwoFingerFromRightEdgeSwipeGesture = 0;
      };

      # setting this is only possible if the terminal you use has full disk access in System Settings
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };
    };

    primaryUser = "${specialArgs.username}";

    # This value should match the default at the time of first nix-darwin
    # install on a given machine.
    stateVersion = 5;

  };
}
