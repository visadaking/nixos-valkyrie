{ pkgs, ... }:

{
  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
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

  # KDE Connect
  programs.kdeconnect.enable = true;

  # KDE Partition Manager
  programs.partition-manager.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us,il";
    options = "grp:alt_shift_toggle";
  };

  # Plasma theme
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];

  # Valkyrie wallpaper collection
  environment.etc."valkyrie/wallpapers".source = ../wallpapers;

  # KDE color scheme
  environment.etc."xdg/color-schemes/Carl.colors".source =
    ./plasma/Carl.colors;
}
