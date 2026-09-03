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

  # nix maintenance
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.auto-optimise-store = true;

  # flatpak
  services.flatpak.enable = true;
}