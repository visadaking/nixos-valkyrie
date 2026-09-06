{ pkgs, ... }:

{
  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.displayManager.defaultSession = "plasma";

  # Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us,il";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  # KDE / desktop integration
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };

  # Remove KDE bloat
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    okular
    ark
    khelpcenter
    krdp
    plasma-keyboard
    kwin-x11
  ];

  # Plasma theme
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];

  # Valkyrie wallpaper collection
  environment.etc."valkyrie/wallpapers".source = ../media/wallpapers;

  # KDE color scheme
  environment.etc."xdg/color-schemes/Carl.colors".source =
    ./plasma/Carl.colors;
}
