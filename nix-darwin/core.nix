{
  config,
  inputs,
  pkgs,
  ...
}:
{
  nix = {
    buildMachines = [
      {
        hostName = "linux-builder";
        protocol = "ssh-ng";
        sshUser = "builder";
        sshKey = "/etc/nix/builder_ed25519";
        # publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUpCV2N4Yi9CbGFxdDFhdU90RStGOFFVV3JVb3RpQzVxQkorVXVFV2RWQ2Igcm9vdEBuaXhvcwo=";
        publicHostKey = "AAAAC3NzaC1lZDI1NTE5AAAAIK9dd/S5EH5SndM1lJgxb7gdrYEb1Z/PGT7t/y5Y+XJE";
        maxJobs = 4;

        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];

        supportedFeatures = [
          "kvm"
          "benchmark"
          "big-parallel"
        ];
      }
    ];

    distributedBuilds = true;

    extraOptions = ''
      builders-use-substitutes = true
    '';

    gc = {
      automatic = true;

      interval = [
        {
          Weekday = 1; # every Monday
          Hour = 10;
        }
      ];

      options = "--delete-older-than 28d";
    };

    linux-builder = {
      config = {
        boot.binfmt.emulatedSystems = [
          "x86_64-linux"
          "aarch64-linux"
        ];

        virtualisation = {
          cores = 6;

          darwin-builder = {
            diskSize = 40 * 1024;
            memorySize = 16 * 1024;
          };

          # requires that you have previously run `softwareupdate --install-rosetta`
          rosetta.enable = true;
        };

        enable = true;
        ephemeral = true;

        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
      };
    };

    optimise = {
      automatic = true;

      interval = [
        {
          Weekday = 1;
          Hour = 11;
        }
      ];
    };

    # remove if using lix main
    package = pkgs.lixPackageSets.latest.lix;

    settings = {
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath; # see comments on https://github.com/NixOS/nix/pull/11079

      trusted-users = [
        "@admin"
        "@dn"
        "@root"
      ]; # required to use darwin.linux-builder
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    # The platform the configuration will be used on.
    hostPlatform = "aarch64-darwin";

    # remove if using lix main
    overlays = [
      (final: prev: {
        inherit (prev.lixPackageSets.latest)
          colmena
          nix-eval-jobs
          nix-fast-build
          # FIXME: nixpkgs-review removed due to infinite recursion, see:
          # https://git.lix.systems/lix-project/lix/issues/980
          # nixpkgs-review
          ;
      })

      inputs.jj-starship.overlays.default
    ];
  };

  # Normally the instructions would tell you to use programs to enable fish, tmux, etc.
  # But if you are managing the settings for those programs outside of Nix,
  # it's better to just install them as packages (see system.pkgs)
  programs = { };

  services = {
    # postgres is fairly broken on nix darwin, use brew for now
    #
    # postgresql = {
    #   enable = true;
    #   package = pkgs.postgresql_18;
    #   ensureDatabases = [ "auditdb" ];
    #
    #   ensureUsers = [
    #     {
    #       name = "dn";
    #       ensurePermissions = {
    #         "DATABASE auditdb" = "ALL PRIVILEGES";
    #       };
    #     }
    #   ];
    # };

    tailscale.enable = true;
  };
}
