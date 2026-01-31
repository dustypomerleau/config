{
  config,
  inputs,
  pkgs,
  system,
  ...
}:
{
  nix = {
    linux-builder = {
      enable = true;
      ephemeral = true;

      config = {
        virtualisation = {
          cores = 6;

          darwin-builder = {
            diskSize = 40 * 1024;
            memorySize = 8 * 1024;
          };

          # rosetta.enable = true;
        };
      };
    };

    # remove if using lix main
    package = pkgs.lixPackageSets.latest.lix;

    settings = {
      experimental-features = "nix-command flakes";

      # extra-platforms = [
      #   "aarch64-darwin"
      #   "aarch64-linux"
      #   "x86_64-darwin"
      #   "x86_64-linux"
      # ];

      nix-path = config.nix.nixPath; # see comments on https://github.com/NixOS/nix/pull/11079

      trusted-users = [
        "@admin"
        "@root"
      ]; # required to use darwin.linux-builder

    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    # The platform the configuration will be used on.
    hostPlatform = system;

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
