# modules/maintenance.nix

{ ... }:

{
  # automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # nix store
  nix.settings.auto-optimise-store = true;

  # system updates
  system.autoUpgrade = {
    enable = true;
    flake = "/home/visa/nixos-valkyrie";

    flags = [
      "--print-build-logs"
      "--commit-lock-file"
    ];

    dates = "Sun";
    randomizedDelaySec = "30min";
    allowReboot = false;
  };
}