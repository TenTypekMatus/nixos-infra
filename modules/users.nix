{config, pkgs, ... }:

{
  users.users.matus = {
    isNormalUser = true;
    description = "Matúš Maštena";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [ brave ];
  };
}
