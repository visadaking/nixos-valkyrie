{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/amd.nix
    ./modules/packages.nix
    ./modules/plasma.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/virtualization.nix
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # fstrim nvme  m.2 
  services.fstrim.enable = true;

  # dns
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

  # security
  security.sudo.wheelNeedsPassword = true;
  security.rtkit.enable = true;

  # Nix
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # System
  networking.hostName = "valkyrie";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jerusalem";
  i18n.defaultLocale = "en_US.UTF-8";

  # zsh
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # user
  users.users.visa = {
    isNormalUser = true;
    description = "visa";

    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "video"
      "audio"
    ];

    shell = pkgs.zsh;
  };

  # system version
  system.stateVersion = "26.05";
}