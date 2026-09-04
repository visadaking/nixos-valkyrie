{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
        wineWowPackages.stable
        winetricks
      ];
    })
    bottles
    prism-launcher
    amethyst-mod-manager
    papercutter
    lact
    protonup-qt

    # internet
    signal-desktop
    vesktop
    helium
    qbittorrent
    localsend

    # editing stuff
    obs-studio
    kdenlive
    mpv
    qview
    cine
    reaper
    fooyin
    jellyfin
    audacity
    music-presence

    # internet stuff
    obsidian
    libreoffice
    onlyoffice-bin
    peazip
    bitwarden
    ente-auth
    protonvpn-gui
    shelly
  ];

  nixpkgs.config.allowUnfree = true;
}
