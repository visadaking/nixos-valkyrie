{ pkgs, ... }:

{
  # amd graphics
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd # opencl
      vaapiVdpau # video acceleration
      libvdpau-va-gl
    ];
  };

  # lact
  systemd.packages = with pkgs; [
    lact
  ];

  systemd.services.lact.enable = true;

  # logitech support
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # input device support
  services.ratbagd.enable = true;
}