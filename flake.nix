{
  description = "Valkyrie Flake";

  inputs = {
    fastpotify.url = "github:crmne/fastpotify";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations = {
      valkyrie = nixpkgs.lib.nixosSystem {
        modules = [
          # VM-only settings: these do not affect the real host.
          {
            virtualisation.vmVariant = {
              virtualisation = {
                memorySize = 12288;
                diskSize = 51200;
                cores = 8;
              };

              users.users.visa.initialPassword = "visa";

              services.displayManager.autoLogin = {
                enable = true;
                user = "visa";
              };
            };
          }

          ./configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.visa = import ./home;
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
