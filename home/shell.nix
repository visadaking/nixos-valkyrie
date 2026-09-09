{ ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.git = {
    enable = true;
  };
}
