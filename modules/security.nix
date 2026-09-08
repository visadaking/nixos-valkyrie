{ ... }:

{
  # firewall
  networking.firewall.enable = true;

  # fail2ban
  services.fail2ban.enable = true;

  # sudo
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };
}
