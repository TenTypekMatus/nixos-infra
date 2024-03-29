{config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Agave" ]; })
    # CLI
    distrobox
    python311Packages.pynvim
    python310Packages.setuptools
    python310Packages.pip
    gnome.file-roller
    deluge
    freetube
    ansible
    ansible-lint
    nodejs
    python3
    github-cli
    xfce.thunar
    acpi
    iw
    pfetch
    obs-studio
    kdenlive
    nordic
    protonmail-bridge
    yarn
    bat
    python311Packages.pynvim
    xorg.xprop
    lua
    swaybg
    lollypop
    discord
    alacritty
    pavucontrol
    autotiling
    starship
    fish
    exa
    musikcube
    papirus-icon-theme
    nordic
    jetbrains.idea-community
    vlang
    prismlauncher
    rustc
    cargo
    gcc
    gnumake
    spotify
    noto-fonts-emoji
    vlang
    swayidle
    swaylock-fancy
    transmission
  ];
}
