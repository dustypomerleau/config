# https://librephoenix.com/2023-11-02-how-to-manage-your-dotfiles-the-nix-way-with-home-manager
# https://www.jetpack.io/devbox/docs/guides/using_flakes/
# https://www.breakds.org/post/flake-part-1-packaging/

{
  description = "DP MBP system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
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
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [ pkgs.vim ];

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Create /etc/zshrc that loads the nix-darwin environment.
          programs.zsh.enable = true; # default shell on catalina
          programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 4;

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
