{ config, pkgs, ... }:
{
  services = {
    xserver = {
      displayManager.sddm.enable = true;
      libinput.enable = true;
      enable = true;
      layout = "us";
      xkbVariant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};
pantheon.apps.enable = false;
flatpak = {
  enable = true;
};
gnome.gnome-keyring.enable = true;
printing.enable = true;
  };
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';
  i18n = {
    consoleFont = "/etc/static/kbd/consolefonts/Lat2-Terminus16.psfu.gz";
  };
  services.auto-cpufreq.enable = true;
  nixpkgs.config.pulseaudio = true;

}
