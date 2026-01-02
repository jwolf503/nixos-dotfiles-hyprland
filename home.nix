{ config, pkgs, ... }:
{
  imports = [
    ./sh.nix
  ];


  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "jwolf503";
      user.email = "wolfanger.jason1@gmail.com";
      alias = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };  
  };


  home.packages = with pkgs; [
    ripgrep
    nitch
    rofi
    fzf
    fish
    dunst
    libnotify
  ];

  programs.vim.enable = true;
  
  
}

