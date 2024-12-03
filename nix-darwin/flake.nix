# https://vtimofeenko.com/posts/practical-nix-flake-anatomy-a-guided-tour-of-flake.nix/
#
# available nix-darwin configuration options:
# https://daiderd.com/nix-darwin/manual/

{
  description = "DP MBP system flake";

  inputs = {
    darwin = {
      # url = "/Users/dn/me/er/nix-darwin"; # for testing of PRs
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "git+file:///Users/dn/me/er/fenix";
      # url = "github:nix-community/fenix";
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
      computername = "mp";
      hostname = "mp";
      system = "aarch64-darwin";
      username = "dn";

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
