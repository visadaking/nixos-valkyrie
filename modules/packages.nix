{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # system & cli
    nano
    neovim
    git
    curl
    wget
    python3
    fastfetch
    hyfetch
    btop
    starship

    # management & hardware
    mission-center
    gparted
    smartmontools
    ddrescue
    alsa-utils
    pavucontrol
    openal
    virt-manager

    # peripherals
    solaar
    piper

    # gaming
    heroic
    (lutris.override {
      extraPkgs = pkgs: [
        wineWow64Packages.stable
        winetricks
      ];
    })
    bottles
    prismlauncher
    protonup-qt
    mangohud

    # internet
    librewolf
    signal-desktop
    vesktop
    qbittorrent
    localsend

    # privacy & security
    bitwarden-desktop
    ente-auth
    proton-vpn

    # video & streaming
    obs-studio
    kdePackages.kdenlive
    mpv
    qview
    cine
    jellyfin

    # music & audio
    fooyin
    eartag
    reaper
    audacity

    # productivity & documents
    obsidian
    libreoffice
    onlyoffice-desktopeditors
    peazip

  ];

  nixpkgs.config.allowUnfree = true;
}
