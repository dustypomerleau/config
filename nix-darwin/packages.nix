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

}
