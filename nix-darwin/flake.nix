# https://vtimofeenko.com/posts/practical-nix-flake-anatomy-a-guided-tour-of-flake.nix/
#
# available nix-darwin configuration options:
# https://daiderd.com/nix-darwin/manual/

# to add a linux builder, you can follow the flake example here:
# https://ryantm.github.io/nixpkgs/builders/special/darwin-builder/#sec-darwin-builder

# If there is a problem with the Lix daemon, you can revert with:
#
# sudo darwin-rebuild --list-generations
# (find an old generation that might be good)
# sudo darwin-rebuild --switch-generation <generation-number>

# If you were not on nix-darwin, it would be:
# sudo nix-env --rollback -p /nix/var/nix/profiles/default
# sudo launchctl kickstart -k system/org.nixos.nix-daemon

{
  description = "DP MBP system flake";

  inputs = {
    darwin = {
      # url = "git+file///Users/dn/me/er/nix-darwin"; # for local testing
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      # url = "github:dustypomerleau/fenix/sdk"; # until merge of https://github.com/nix-community/fenix/pull/202
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.lix.follows = "lix";
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
      lix-module,
      nixpkgs,
      ...
    }:
    let
      inherit (darwin.lib) darwinSystem;
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
      darwinConfigurations.${hostname} = darwinSystem {
        inherit specialArgs;

        modules = [
          ./brew.nix
          ./core.nix
          ./fenix.nix
          ./home.nix
          ./packages.nix
          ./system.nix
          home-manager.darwinModules.home-manager
          lix-module.nixosModules.default
        ];
      };
    };
}
