{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # core utlis 
    gcc
    gnumake
    binutils
    pkg-config
    psmisc      # killall
    xdg-utils   # OPENING LINKS IN THE APPS !!! 
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

    # sysem stuff
    nano
    fastfetch
    hyfetch
    btop
    mission-center
    pika-backup
    gparted
    neovim
    starship    # prompt for zsh
    smartmontools
    wireguard-tools
    ddrescue
    spotify
    zoom-us
    gpu-screen-recorder
    
    # virt + extra stuff for myself
    solaar
    piper
    lact        # fan controller lole (too lazy to get in bios)
    virt-manager

    # gayming
    heroic
    (lutris.override {
      extraPkgs = pkgs: [ wineWowPackages.stable winetricks ];
    })
    bottles
    prism-launcher
    amethyst-mod-manager
    protonup-qt

    # yes i use the internet 
    speedtest-cli
    signal-desktop
    vesktop
    helium
    qbittorrent
    localsend
    bitwarden
    ente-auth
    protonvpn-gui

    # i guess editing and recording?
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

    # office stuff i guess
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
    
    # starship for zsh shell
    promptInit = ''
      eval "$(starship init zsh)"
    '';
  };

  # nix
  nixpkgs.config.allowUnfree = true;
}