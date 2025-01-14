# https://vtimofeenko.com/posts/practical-nix-flake-anatomy-a-guided-tour-of-flake.nix/
#
# available nix-darwin configuration options:
# https://daiderd.com/nix-darwin/manual/

# to add a linux builder, you can follow the flake example here:
# https://ryantm.github.io/nixpkgs/builders/special/darwin-builder/#sec-darwin-builder

{
  description = "DP MBP system flake";

  inputs = {
    darwin = {
      # url = "git+file///Users/dn/me/er/nix-darwin"; # for local testing
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      # url = "git+file:///Users/dn/me/er/fenix"; # for local testing
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
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
