# https://vtimofeenko.com/posts/practical-nix-flake-anatomy-a-guided-tour-of-flake.nix/
# 
# available nix-darwin configuration options:
# https://daiderd.com/nix-darwin/manual/

{
  description = "DP MBP system flake";

  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      # url = "/Users/dustinpomerleau/me/er/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      darwin,
      fenix,
      home-manager,
      lix,
      nixpkgs,
      ...
    }:
    let
      computername = "DP MBP";
      hostname = "DP-2018-MBP";
      system = "x86_64-darwin"; # for Apple silicon, use "aarch64-darwin"
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
          ./fenix.nix
          ./home.nix
          ./packages.nix
          ./system.nix
          home-manager.darwinModules.home-manager
          lix.nixosModules.default
        ];
      };
    };
}
