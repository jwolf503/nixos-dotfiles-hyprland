{
  config,
  pkgs,
  lib,
  ...
}:
{

  home.packages = with pkgs; [
    fuzzel
    polkit_gnome
    wlr-randr
    wtype
    wl-clipboard
    hyprland-protocols
    hyprpicker
    swayidle
    swaybg
    xdg-desktop-portal-hyprland
    wlsunset
    grim
    slurp
    pyprland
    hyprlauncher
    hicolor-icon-theme
    desktop-file-utils
  ];
}
