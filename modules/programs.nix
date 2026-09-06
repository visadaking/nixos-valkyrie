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
    enableCompletion = true;

    shellAliases = {
      # General
      v = "nvim";

      # valkyrie shell
      v-edit = "nvim ~/nixos-valkyrie";
      v-check = "cd ~/nixos-valkyrie && nix flake check .";
      v-dry = "cd ~/nixos-valkyrie && sudo nixos-rebuild dry-build --flake .#valkyrie";
      v-switch = "cd ~/nixos-valkyrie && sudo nixos-rebuild switch --flake .#valkyrie";

      # maintenance
      v-clean = "sudo nix-collect-garbage --delete-older-than 30d";

      # git backups
      v-backup = "git -C ~/nixos-valkyrie push origin main && git -C ~/nixos-valkyrie push backup main";
    };
  };

  users.users.visa = {
    isNormalUser = true;
    description = "visa";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };
}
