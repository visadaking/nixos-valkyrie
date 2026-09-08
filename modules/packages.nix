{ pkgs, inputs, ... }:

let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  environment.etc."xdg/kitty/kitty.conf".text = ''
    # disable kitty remote control
    allow_remote_control no
  '';

  environment.systemPackages = with pkgs; [

    # system & cli
    btop
    cowsay
    curl
    fastfetch
    git
    hyfetch
    kitty
    nano
    neovim
    nh
    python3
    starship
    wget
    zed-editor

    cameractrls

    # management & hardware
    alsa-utils
    ddrescue
    gparted
    mission-center
    openal
    pavucontrol
    qdiskinfo
    qdirstat
    smartmontools
    # bluetooth
    open-scq30

    # peripherals
    piper
    solaar

    # gaming
    bottles
    gearlever
    heroic
    itch
    itch-dl
    (lutris.override {
      extraPkgs = pkgs: [
        wineWow64Packages.stable
        winetricks
      ];
    })
    mangohud
    prismlauncher
    protonup-qt

    pkgsUnstable.halloy

    # internet
    ayugram-desktop
    discordchatexporter-desktop
    librewolf
    localsend
    pkgsUnstable.musicpresence
    qbittorrent
    redact
    signal-desktop
    vesktop

    # privacy & security
    bitwarden-desktop
    ente-auth
    proton-vpn
    simplex-chat-desktop

    handbrake

    # video & streaming
    cine
    filezilla
    jellyfin-desktop
    kdePackages.isoimagewriter
    kdePackages.kdenlive
    mpv
    obs-studio
    qview

    easyeffects

    nicotine-plus

    # music & audio
    audacity
    eartag
    fooyin
    freac
    qalculate-qt
    reaper
    spicetify-cli
    spotify

    thunderbird

    element-desktop

    krita

    inkscape

    modrinth-app

    # productivity & documents
    libreoffice
    obsidian
    onlyoffice-desktopeditors
    peazip

  ];

  nixpkgs.config.allowUnfree = true;
}
