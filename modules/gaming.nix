{ pkgs, ... }:

{
  # gaming kernel support
  boot.kernelModules = [ "ntsync" ];

  # steam & proton
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  # gaming binary cache
  nix.settings = {
    extra-substituters = [
      "https://nix-gaming.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1g/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };
}
