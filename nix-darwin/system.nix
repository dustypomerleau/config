{ specialArgs, ... }:
{
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

    computerName = specialArgs.computername;
    hostName = specialArgs.hostname;

    knownNetworkServices = [
      "Thunderbold Ethernet"
      "Wi-Fi"
    ];

    localHostName = specialArgs.hostname;
  };

  security.pam.enableSudoTouchIdAuth = true;

  system = {
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
        location = "/Users/${specialArgs.username}/Pictures/screenshots/";
      };

      trackpad = {
        ActuationStrength = 0;
        Clicking = true; # enable tap to click
        Dragging = true; # tap to drag (same as drag lock?)
        DragLock = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };

      # setting this is only possible if the terminal you use has full disk access in System Settings
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };
    };
    # can system.patches be used to run a script containing defaults write commands that aren't covered here?
  };
}
