{ config, system, ... }:
{
  nix.settings = {
    experimental-features = "nix-command flakes";
    nix-path = config.nix.nixPath; # see comments on https://github.com/NixOS/nix/pull/11079
    trusted-users = [
      "@admin"
      "@root"
    ]; # required to use darwin.linux-builder
  };

  nixpkgs = {
    config.allowUnfree = true;
    # The platform the configuration will be used on.
    hostPlatform = system;
  };

  # Normally the instructions would tell you to use programs to enable fish, tmux, etc.
  # But if you are managing the settings for those programs outside of Nix,
  # it's better to just install them as packages (see system.pkgs)
  programs = { };

  services = {
    # see many postgres options in services.postgresql.*
    # tailscale.enable = true; # reenable after https://github.com/NixOS/nixpkgs/pull/387998
  };
}
