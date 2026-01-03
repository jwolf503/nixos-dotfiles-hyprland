{
  description = "Home Manager configuration of jay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, nvf, ... }:
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
              extraSpecialArgs = { inherit nvf; };
              modules = [ 
                  nvf.homeManagerModules.default
                 ./modules/nvfmax.nix
                 ./home.nix
                     ];
                 };
               

        };
    
}
