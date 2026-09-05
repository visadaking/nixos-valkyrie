{ config, pkgs, ... }:

{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];
  boot.kernelModules = [ "ntsync" ];

  # DNS
  networking.networkmanager.dns = "systemd-resolved";

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

  # Security
  networking.firewall.enable = true;
  services.fail2ban.enable = true;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };

  security.rtkit.enable = true;

  # Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  hardware.enableRedistributableFirmware = true;

  # KDE Plasma / Wayland

  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };

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
    options = "--delete-older-than 14d";
  };

  nix.settings.auto-optimise-store = true;

  nix.settings = {
    extra-substituters = [
      "https://nix-gaming.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1g/f3hXemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # Automatic updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    channel = "https://channels.nixos.org/nixos-26.05";
    allowReboot = false;
  };

  systemd.services.nixos-upgrade.postStop = ''
    ${pkgs.util-linux}/bin/wall "NixOS has finished Updating."
  '';

  # flatpak
  # nuclear is kept here because the native package is outdated.
  services.flatpak = {
    enable = true;

    packages = [
      "org.js.nuclear.Nuclear"
    ];
  };
}
