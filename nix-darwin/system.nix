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

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

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

        # For hotkeys, the `parameters` are ascii code, virtual keycode, modifier combination
        "com.apple.symbolichotkeys".AppleSymbolicHotKeys = {
          "32".enabled = false; # Mission Control show all windows
          "33".enabled = false; # Mission Control show app windows
          "36".enabled = false; # Mission Control show desktop
          "52".enabled = false; # Toggle Dock autohide
          "60".enabled = false; # Select previous input source
          "61".enabled = false; # Select next input source
          "118".enabled = false;
          "175".enabled = false;
          "190".enabled = false;
          "222".enabled = false;
          "232".enabled = true; # Enable speak items to allow 230, 231 below
          "260".enabled = false;

          # ctrl + option + N to move left a space in Mission Control
          "79" = {
            enabled = true;

            value = {
              parameters = [
                110
                45
                786432
              ];

              type = "standard";
            };
          };

          # ctrl + option + E to move right a space in Mission Control
          "81" = {
            enabled = true;

            value = {
              parameters = [
                101
                14
                786432
              ];

              type = "standard";
            };
          };

          # ctrl + space to show the notification center
          "163" = {
            enabled = true;

            value = {
              parameters = [
                32
                49
                262144
              ];

              type = "standard";
            };
          };

          # control + option + cmd + S to toggle speak selected items
          "230" = {
            enabled = true;

            value = {
              parameters = [
                115
                1
                1835008
              ];

              type = "standard";
            };
          };

          # control + option + S to toggle speak items under the cursor
          "231" = {
            enabled = true;

            value = {
              parameters = [
                115
                1
                786432
              ];

              type = "standard";
            };
          };
        };
      };

      CustomUserPreferences = { };

      NSGlobalDomain = {
        "com.apple.mouse.tapBehavior" = 1; # tap to click
        "com.apple.sound.beep.feedback" = 0; # feedback when volume is changed
        "com.apple.trackpad.forceClick" = false;
        "com.apple.trackpad.scaling" = 3.0; # 3 is maximum tracking speed
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      WindowManager.StandardHideDesktopIcons = true;
      WindowManager.StandardHideWidgets = true;

      controlcenter = {
        AirDrop = false;
        BatteryShowPercentage = true;
        Bluetooth = true;
        Display = false;
        FocusModes = false;
        NowPlaying = false;
        Sound = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 1.0e-2;
        expose-animation-duration = 0.0;
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
        NewWindowTarget = "Other";
        NewWindowTargetPath = "~/Library/CloudStorage/Dropbox";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        _FXEnableColumnAutoSizing = true;
        _FXSortFoldersFirst = true;
      };

      loginwindow.GuestEnabled = false;

      menuExtraClock = {
        FlashDateSeparators = false;
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

# helper for keycodes, from:
# https://github.com/NUIKit/CGSInternal/blob/master/CGSHotKeys.h
#
# /// The system defines a limited number of "symbolic" hot keys that are remembered system-wide.  The
# /// original intent is to have a common registry for the action of function keys and numerous
# /// other event-generating system gestures.
# typedef enum {
# 	// full keyboard access hotkeys
# 	kCGSHotKeyToggleFullKeyboardAccess = 12,
# 	kCGSHotKeyFocusMenubar = 7,
# 	kCGSHotKeyFocusDock = 8,
# 	kCGSHotKeyFocusNextGlobalWindow = 9,
# 	kCGSHotKeyFocusToolbar = 10,
# 	kCGSHotKeyFocusFloatingWindow = 11,
# 	kCGSHotKeyFocusApplicationWindow = 27,
# 	kCGSHotKeyFocusNextControl = 13,
# 	kCGSHotKeyFocusDrawer = 51,
# 	kCGSHotKeyFocusStatusItems = 57,
#
# 	// screenshot hotkeys
# 	kCGSHotKeyScreenshot = 28,
# 	kCGSHotKeyScreenshotToClipboard = 29,
# 	kCGSHotKeyScreenshotRegion = 30,
# 	kCGSHotKeyScreenshotRegionToClipboard = 31,
#
# 	// universal access
# 	kCGSHotKeyToggleZoom = 15,
# 	kCGSHotKeyZoomOut = 19,
# 	kCGSHotKeyZoomIn = 17,
# 	kCGSHotKeyZoomToggleSmoothing = 23,
# 	kCGSHotKeyIncreaseContrast = 25,
# 	kCGSHotKeyDecreaseContrast = 26,
# 	kCGSHotKeyInvertScreen = 21,
# 	kCGSHotKeyToggleVoiceOver = 59,
#
# 	// Dock
# 	kCGSHotKeyToggleDockAutohide = 52,
# 	kCGSHotKeyExposeAllWindows = 32,
# 	kCGSHotKeyExposeAllWindowsSlow = 34,
# 	kCGSHotKeyExposeApplicationWindows = 33,
# 	kCGSHotKeyExposeApplicationWindowsSlow = 35,
# 	kCGSHotKeyExposeDesktop = 36,
# 	kCGSHotKeyExposeDesktopsSlow = 37,
# 	kCGSHotKeyDashboard = 62,
# 	kCGSHotKeyDashboardSlow = 63,
#
# 	// spaces (Leopard and later)
# 	kCGSHotKeySpaces = 75,
# 	kCGSHotKeySpacesSlow = 76,
# 	// 77 - fn F7 (disabled)
# 	// 78 - ⇧fn F7 (disabled)
# 	kCGSHotKeySpaceLeft = 79,
# 	kCGSHotKeySpaceLeftSlow = 80,
# 	kCGSHotKeySpaceRight = 81,
# 	kCGSHotKeySpaceRightSlow = 82,
# 	kCGSHotKeySpaceDown = 83,
# 	kCGSHotKeySpaceDownSlow = 84,
# 	kCGSHotKeySpaceUp = 85,
# 	kCGSHotKeySpaceUpSlow = 86,
#
# 	// input
# 	kCGSHotKeyToggleCharacterPallette = 50,
# 	kCGSHotKeySelectPreviousInputSource = 60,
# 	kCGSHotKeySelectNextInputSource = 61,
#
# 	// Spotlight
# 	kCGSHotKeySpotlightSearchField = 64,
# 	kCGSHotKeySpotlightWindow = 65,
#
# 	kCGSHotKeyToggleFrontRow = 73,
# 	kCGSHotKeyLookUpWordInDictionary = 70,
# 	kCGSHotKeyHelp = 98,
#
# 	// displays - not verified
# 	kCGSHotKeyDecreaseDisplayBrightness = 53,
# 	kCGSHotKeyIncreaseDisplayBrightness = 54,
# } CGSSymbolicHotKey;
