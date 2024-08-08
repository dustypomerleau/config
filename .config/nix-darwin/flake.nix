# https://librephoenix.com/2023-11-02-how-to-manage-your-dotfiles-the-nix-way-with-home-manager
# https://www.jetpack.io/devbox/docs/guides/using_flakes/
# https://www.breakds.org/post/flake-part-1-packaging/

# available configuration options:
# https://daiderd.com/nix-darwin/manual/

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
      configuration =
        { pkgs, ... }:
        {
          environment = {
            shells = [
              pkgs.zsh
              pkgs.fish
            ];

            # List packages installed in system profile. To search by name, run:
            # $ nix-env -qaP | grep wget
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
            casks = [ ];

            cask_args = {
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
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          programs.fish.enable = true;

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          system = {
            # Set Git commit hash for darwin-version.
            configurationRevision = self.rev or self.dirtyRev or null;

            # Used for backwards compatibility, please read the changelog before changing.
            # $ darwin-rebuild changelog
            stateVersion = 4;
          };

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "x86_64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#DP-2018-MBP
      darwinConfigurations."DP-2018-MBP" = nix-darwin.lib.darwinSystem { modules = [ configuration ]; };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."DP-2018-MBP".pkgs;
    };
}

# outputs = { self, nixpkgs, fh, .. } @ inputs:
#     let
#       supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
#       forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
#         inherit system;
#         pkgs = import nixpkgs { inherit system; };
#       });
#     in
#     {
#       devShells = forEachSupportedSystem ({ pkgs, system }: {
#         default = pkgs.mkShell {
#           packages = [
#             fh.packages.${system}.fh
#           ];
#         };
#       });
#     };
# }
