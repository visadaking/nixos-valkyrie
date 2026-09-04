{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamemode.enable = true;
  programs.zsh.enable = true;

  services.xserver.xkb = {
    layout = "us,il";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  users.users.visa = {
    isNormalUser = true;
    description = "visa";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "libvirtd" ];
    shell = pkgs.zsh;
  };
}
