{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sh.nix
    ./nvfmax.nix
    ./hyprland.nix
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
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  home.packages = with pkgs; [
    ripgrep
    nitch
    rofi
    fzf
    dunst
    libnotify
    lazygit
    ghostty
    zoxide
    tealdeer
    rustup
    neovim
  ];

  programs.vim.enable = true;
}
