{ pkgs, inputs, ... }:

let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages = with pkgs; [

    # system & cli
    nano
    neovim
    kitty
    nh
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
    # bluetooth
    open-scq30

    # peripherals
    solaar
    piper

    # gaming
    heroic
    itch
    itch-dl
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
    pkgsUnstable.musicpresence
    redact
    discordchatexporter-desktop

    # privacy & security
    bitwarden-desktop
    ente-auth
    proton-vpn
    simplex-chat-desktop

    # video & streaming
    obs-studio
    kdePackages.kdenlive
    mpv
    qview
    cine
    jellyfin
    filezilla

    # music & audio
    fooyin
    eartag
    reaper
    audacity
    spotify
    spicetify-cli

    # productivity & documents
    obsidian
    libreoffice
    onlyoffice-desktopeditors
    peazip

  ];

  nixpkgs.config.allowUnfree = true;
}
