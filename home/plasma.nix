{ ... }:

{
  xdg.configFile."kdeglobals".source = ./kde/kdeglobals;
  xdg.configFile."kglobalshortcutsrc".source = ./kde/kglobalshortcutsrc;
  xdg.configFile."kwinoutputconfig.json".source = ./kde/kwinoutputconfig.json;
  xdg.configFile."kwinrc".source = ./kde/kwinrc;
  xdg.configFile."kwinrulesrc".source = ./kde/kwinrulesrc;
  xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc".source =
    ./kde/plasma-org.kde.plasma.desktop-appletsrc;
  xdg.configFile."plasmarc".source = ./kde/plasmarc;
  xdg.configFile."plasmashellrc".source = ./kde/plasmashellrc;
}
