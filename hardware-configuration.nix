{ config, lib, pkgs, modulesPath, ... }:

{
  # placeholder 
  # replace this entire file with the one generated in /etc/nixos/
  imports = [ ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  fileSystems."/" = lib.mkDefault { };
}