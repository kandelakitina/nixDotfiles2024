{
  description = "Boticelli's flake 2024";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        boticelli = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        boticelli = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
