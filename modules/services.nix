{ lib, pkgs, ... }:

{
  systemd.oomd.enable = true;

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];

  # Networking / DNS
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNSSEC = "true";
      Domains = [ "~." ];
      DNSOverTLS = "true";

      DNS = [
        "9.9.9.9#dns.quad9.net"
        "1.1.1.2#security.cloudflare-dns.com"
        "149.112.112.112#dns.quad9.net"
        "1.0.0.2#security.cloudflare-dns.com"
      ];
    };
  };

  security.rtkit.enable = true;

  # Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  hardware.enableRedistributableFirmware = true;

  # Firmware updates
  # hardware maintenance policy:
  # LVFS/fwupd where supported -> native linux subsystem where firmware is not relevant
  # -> official vendor mechanism only when necessary.
  services.fwupd.enable = true;

  # logitech brio 100 (UVC webcam) and xbox compatible controllers.
  boot.kernelModules = [
    "uvcvideo"
    "xpad"
  ];

  # Audio
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Memory
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
    priority = 100;
  };

  # Nix garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;


  };

  # Automatic upgrades intentionally disabled.
  # Valkyrie updates should be reviewed and applied manually.
  system.autoUpgrade.enable = false;

  # Printing intentionally disabled: Valkyrie has no printer workflow.
  services.printing.enable = false;

  # Amethyst Mod Manager uses its own Flatpak remote.
  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "modmanager-origin";
      location = "https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakrepo";
    }
  ];

  # Flatpak
  # Nuclear is kept here because the native package is outdated.
  services.flatpak = {
    enable = true;

    packages = [
      "com.nuclearplayer.Nuclear"
      {
        appId = "io.github.Amethyst.ModManager";
        origin = "modmanager-origin";
      }
    ];

    restartOnFailure = {
      enable = true;
      restartDelay = "60s";
      exponentialBackoff = {
        enable = true;
      };
    };
  };
}
