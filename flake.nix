{
  description = "Valkyrie Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs: {
    nixosConfigurations.valkyrie = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; 
      modules = [
        ./configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}