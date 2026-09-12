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
    lazygit
    hyfetch
    kitty
    nano
    neovim
    kdePackages.kate
    nh
    python3
    starship
    tldr
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
    modrinth-app
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
    element-desktop
    librewolf
    localsend
    pkgsUnstable.musicpresence
    qbittorrent
    redact
    signal-desktop
    thunderbird
    legcord

    # privacy & security
    keepassxc
    syncthing
    ente-auth
    proton-vpn
    simplex-chat-desktop
    mumble

    # video & streaming
    ffmpeg
    cine
    filezilla
    handbrake
    jellyfin-desktop
    kdePackages.isoimagewriter
    kdePackages.kdenlive
    mpv
    obs-studio
    qview

    # music & audio
    audacity
    easyeffects
    eartag
    fooyin
    freac
    nicotine-plus
    qalculate-qt
    reaper
    inputs.fastpotify.packages."${pkgs.stdenv.hostPlatform.system}".default

    # graphics
    inkscape
    krita

    # productivity & documents
    libreoffice
    logseq
    peazip

  ];

  nixpkgs.config.allowUnfree = true;
}
