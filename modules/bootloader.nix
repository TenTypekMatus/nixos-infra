{config, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.bootspec.enable = true;
}
