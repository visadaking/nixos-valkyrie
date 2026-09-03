{ pkgs, ... }:

{
  # kde plasma 6
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # prefer wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # keyboard layout
  services.xserver.xkb = {
    layout = "us,il";
    options = "grp:alt_shift_toggle";
  };

  # plasma customization
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    capitaine-cursors
  ];
}