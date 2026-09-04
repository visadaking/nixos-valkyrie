{ pkgs, ... }:

{
  # kde plasma 6
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # removing kde bloat
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

  # kde connect
  programs.kdeconnect.enable = true;

  # KDE Partition Manager
  programs.partition-manager.enable = true;

  # keyboard layout
  services.xserver.xkb = {
    layout = "us,il";
    options = "grp:alt_shift_toggle";
  };

  # plasma theme
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    capitaine-cursors
  ];
}