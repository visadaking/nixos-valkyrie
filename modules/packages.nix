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
    nano
    neovim
    kitty
    cowsay
    vscodium
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
    qdirstat
    qdiskinfo
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
    gearlever
    mangohud

    # internet
    librewolf
    ayugram-desktop
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
    kdePackages.isoimagewriter
    mpv
    qview
    cine
    jellyfin-desktop
    filezilla

    # music & audio
    fooyin
    eartag
    freac
    reaper
    audacity
    qalculate-qt
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
