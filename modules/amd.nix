{ ... }:

{
  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.lact.enable = true;

  services.ratbagd.enable = true;
}
