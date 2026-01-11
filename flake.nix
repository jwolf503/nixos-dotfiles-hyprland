{
  description = "Home Manager configuration of jay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    jj.url = "github:jj-vcs/jj";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    jj,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations."nixos-jay" = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
      ];
    };
    homeConfigurations."jay" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit jj;
      };
      modules = [
          ./home.nix
          nixvim.homeManagerModules.nixvim
          .modules/nixim/config/default.nix
      ];
    };
  };
}
