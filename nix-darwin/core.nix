{ system, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  programs = {
    fish.enable = true;
    tmux.enable = true;
  };

  services = {
    nix-daemon.enable = true;
    # see many postgres options in services.postgresql.*
    tailscale.enable = true;
  };
}
