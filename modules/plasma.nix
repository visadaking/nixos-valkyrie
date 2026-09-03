{ pkgs, ... }:

{
  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Prefer Wayland for Electron/Chromium applications
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us,il";
    options = "grp:alt_shift_toggle";
  };

  # Plasma customization
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    capitaine-cursors
  ];
}