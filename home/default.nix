{ ... }:

{
  imports = [
    ./shell.nix
    ./plasma.nix
  ];

  home.username = "visa";
  home.homeDirectory = "/home/visa";

  home.stateVersion = "26.05";
}
