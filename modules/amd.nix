{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lact.enable = true;

  services.ratbagd.enable = true;
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="046d", MODE="0666"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", MODE="0666"
  '';
}
