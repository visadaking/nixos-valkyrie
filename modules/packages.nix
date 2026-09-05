{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openal
    # CLI & Utils
    nano
    git
    curl
    wget
    fastfetch
    hyfetch
    btop
    mission-center
    pika-backup
    alsa-utils
    pavucontrol
    mangohud
    gparted
    neovim
    starship
    python3
    ddrescue
    smartmontools

    # Peripherals & Hardware
    solaar
    piper
    virt-manager

    # Gaming Launchers & Tools
    heroic
    (lutris.override {
      extraPkgs = pkgs: [
        wineWow64Packages.stable
        winetricks
      ];
    })
    bottles
    prismlauncher
    lact
    protonup-qt

    # internet
  signal-desktop
  vesktop
  librewolf
  qbittorrent
  localsend

  # editing stuff
    obs-studio
    kdePackages.kdenlive
    mpv
    qview
    cine
    reaper
    fooyin
    jellyfin
    audacity


    # internet stuff
    obsidian
    libreoffice
  onlyoffice-desktopeditors
    peazip
    bitwarden-desktop
    ente-auth
    proton-vpn

  ];

  nixpkgs.config.allowUnfree = true;
}
