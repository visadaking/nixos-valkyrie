{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/amd.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/virtualization.nix
    ./modules/plasma.nix
  ];

  networking.hostName = "valkyrie";
  time.timeZone = "Asia/Jerusalem";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "26.05";


}
