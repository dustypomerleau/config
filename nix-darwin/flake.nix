# https://librephoenix.com/2023-11-02-how-to-manage-your-dotfiles-the-nix-way-with-home-manager
# https://www.jetpack.io/devbox/docs/guides/using_flakes/
# https://www.breakds.org/post/flake-part-1-packaging/

# available configuration options:
# https://daiderd.com/nix-darwin/manual/

# todo: 
# - [ ] migrate packages from brew to nix
# - [ ] add all casks
# - [x] add home manager
# - [ ] code splitting
# - [ ] scripts for all defaults write?
# - [ ] add home manager files

{
  description = "DP MBP system flake";

  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      darwin,
      home-manager,
      nixpkgs,
      ...
    }:
    let
      computername = "DP MBP";
      hostname = "DP-2018-MBP";
      system = "x86_64-darwin";
      username = "dustinpomerleau";

      specialArgs = {
        inherit
          inputs
          computername
          hostname
          system
          username
          ;
      };
    in
    {
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        inherit specialArgs;

        modules = [
          ./brew.nix
          ./core.nix
          ./home.nix
          ./packages.nix
          ./system.nix
          home-manager.darwinModules.home-manager
        ];

        system.configurationRevision = self.rev or self.dirtyRev or null;
      };
    };
}
