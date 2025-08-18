{
  description = "LyonOS v0.1.0 flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "lyon";
      pkgs = import nixpkgs {
	inherit system;
	config = {
	  allowUnfree = true;
	 };
	};
    in {
      nixosConfigurations."RTS" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.${username} = import ./home.nix {
	      config = {};
              inherit pkgs;
              lib = home-manager.lib;
            };
          }
        ];
      };
    };
}
