```nix
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # core utilities
    gcc
    gnumake
    binutils
    pkg-config
    psmisc
    xdg-utils
    procps
    wget
    curl
    git
    python3
    ffmpeg-full
    zip
    unzip
    ripgrep
    fd
    nil
    playerctl
    jq
    nodejs
    libnotify

    # system tools
    nano
    fastfetch
    mission-center
    pika-backup
    gparted
    neovim
    starship
    smartmontools
    wireguard-tools
    ddrescue
    spotify
    zoom-us
    gpu-screen-recorder

    # virtualization and personal utilities
    solaar
    piper
    lact
    virt-manager

    # gaming
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
    protonup-qt

    # internet
    speedtest-cli
    signal-desktop
    vesktop
    helium
    qbittorrent
    localsend
    bitwarden
    ente-auth
    protonvpn-gui

    # media and recording
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
    freac

    # office
    obsidian
    libreoffice
    onlyoffice-bin
    peazip
    shelly
  ];

  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # starship prompt
    promptInit = ''
      eval "$(starship init zsh)";
    '';
  };
}
```
