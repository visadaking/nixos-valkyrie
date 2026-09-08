{ ... }:

{
  # if a capability is not required, don't expose it by default.

  # firewall
  networking.firewall.enable = true;

  # ssh
  services.openssh.enable = true;

  # fail2ban
  services.fail2ban.enable = true;

  # sudo
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };
}
