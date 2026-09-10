{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./plasma.nix
  ];

  home.username = "visa";
  home.homeDirectory = "/home/visa";

  home.file.".config/fastfetch/zelda.txt".source =
    ./fastfetch/zelda.txt;

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "file";
        source = "${config.home.homeDirectory}/.config/fastfetch/zelda.txt";
      };

      display = {
        separator = "  ";
      };

      modules = [
        {
          type = "custom";
          format = "╭─[ valkyrie@visa ]──────────────────────────────╮";
        }

        {
          type = "custom";
          format = "│                                              │";
        }

        "os"
        "kernel"
        "cpu"
        "gpu"

        {
          type = "memory";
          format = "│  MEMORY    {used} / {total}";
        }

        {
          type = "swap";
          format = "│  SWAP      {used} / {total}";
        }

        {
          type = "disk";
          format = "│  DISK      {used} / {total}";
          folders = [ "/" ];
        }

        {
          type = "custom";
          format = "│                                              │";
        }

        "de"
        "wm"
        "shell"
        "packages"

        {
          type = "custom";
          format = "│                                              │";
        }

        {
          type = "custom";
          format = "╰──────────────────────────────────────────────╯";
        }

        {
          type = "custom";
          format = "you've met with a terrible fate, haven't you?";
        }
      ];
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NE";
      size = 10.0;
    };
    settings = {
      shell = "zsh";
      hide_window_decorations = "no";
      foreground = "#d8dee9";
      background = "#000000";
      cursor = "#ffffff";
      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";
      window_padding_width = 10;
      background_opacity = "0.80";
      background_blur = 1;
      dynamic_background_opacity = "yes";
    };
  };
  home.stateVersion = "26.05";
}
