{
  description = "Home Manager configuration of jay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations."nixos-jay" =
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
        };


        homeConfigurations."jay" = 
          home-manager.lib.homeManagerConfiguration {
             pkgs = nixpkgs.legacyPackages.${system};
              modules = [ ./home.nix ];

      };
    };
}
