{ config, lib, pkgs, ... }:

{
  # native
  hardware.amdgpu.overdrive.enable = true;

  # NixOS Wiki: Enable AMD GPU kernel module early for KMS
  boot.initrd.kernelModules = [ "amdgpu" ];

  # gpu
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd # opencl
      vaapiVdpau           # video acceleration
      libvdpau-va-gl
    ];
  };

  # lact
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lact.enable = true;

  # logitech support
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true; # solaar for logitech XDDDDDDD

  # input device support 
  services.ratbagd.enable = true;