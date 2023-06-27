{ config, pkgs, lib, ... }:

{
  services.tailscale.enable = true;
  # Tell the firewall to implicitly trust packets routed over Tailscale:
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  security.auditd.enable = true;
  security.audit.enable = true;
  security.audit.rules = [
    "-a exit,always -F arch=b64 -S execve"
  ];
  nix.allowedUsers = [ "@wheel" ];
  environment.defaultPackages = lib.mkForce [
    pkgs.foot
    pkgs.xterm
  ];
  services.openssh = {
    passwordAuthentication = false;
    allowSFTP = false; # Don't set this if you need sftp
    challengeResponseAuthentication = false;
    extraConfig = ''
      AllowTcpForwarding yes
      X11Forwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
    '';
  };
}
