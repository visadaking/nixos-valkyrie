{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;

    # valkyrie shell shortcuts
    shellAliases = {
      v = "nvim";
      v-switch = "sudo nixos-rebuild switch --flake ~/nixos-valkyrie#valkyrie";
      v-edit = "nvim ~/nixos-valkyrie";
      v-clean = "sudo nix-collect-garbage --delete-older-than 30d";
      v-backup = "git -C ~/nixos-valkyrie push origin main && git -C ~/nixos-valkyrie push backup main";
    };
  };

  # xbox controller support
  hardware.xone.enable = true;
}