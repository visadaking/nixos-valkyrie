{ ... }:

{
  # security
  networking.firewall.enable = true;

  # hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  hardware.enableRedistributableFirmware = true;

  # audio infrastructure
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # flatpak
  services.flatpak.enable = true;
}