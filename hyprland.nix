{ config, pkgs, lib, ... };

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
                gtlock
                swaybg
                xdg-desktop-portal-hyprland
                wlsunset
                grim
                slurp

        ]

}

