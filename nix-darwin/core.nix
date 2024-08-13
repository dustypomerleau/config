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
    # many options in services.postgresql.* left off for now
    tailscale.enable = true;
  };
}
