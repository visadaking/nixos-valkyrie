{ ... }:

{
  # kde appearance
  xdg.configFile."kdeglobals".source = ./kde/kdeglobals;
  xdg.configFile."plasmarc".source = ./kde/plasmarc;

  # plasma desktop, panels and widgets
  xdg.configFile."plasmashellrc".source = ./kde/plasmashellrc;
  xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc".source =
    ./kde/plasma-org.kde.plasma.desktop-appletsrc;

  # kwin settings and rules
  xdg.configFile."kwinrc".source = ./kde/kwinrc;
  xdg.configFile."kwinrulesrc".source = ./kde/kwinrulesrc;
  xdg.configFile."kwinoutputconfig.json".source =
    ./kde/kwinoutputconfig.json;

  # global kde shortcuts
  xdg.configFile."kglobalshortcutsrc".source =
    ./kde/kglobalshortcutsrc;
}
