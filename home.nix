
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sh.nix
    ./hyprland.nix
    ./modules/nixvim/default.nix
  ];

  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    # EDITOR = "vim";

      GTK_ICON_THEME = "Papirus";
  GTK_THEME = "Adwaita-dark";
  XDG_DATA_DIRS =
    "${pkgs.gtk3}/share:"
    + "${pkgs.gtk4}/share:"
    + "${pkgs.papirus-icon-theme}/share:"
    + "${pkgs.adwaita-icon-theme}/share:"
    + "$XDG_DATA_DIRS";
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
    nushell
    floorp-bin
    vscodium
    btop
    opencode
    papirus-icon-theme
    adwaita-icon-theme
    geany-with-vte
   #vimPlugins.tokyonight-nvim
   #vimPlugins.nvim-cmp
   #vimPlugins.nvim-treesitter
   #vimPlugins.telescope-nvim
   #vimPlugins.LazyVim
    wget
    brave
    foot
    quickshell
    kitty
    pcmanfm
    wofi
    hyprpaper
    ly
    pwvucontrol
    nwg-look
    arc-theme
    brightnessctl
    gpu-screen-recorder
    thunar
    thunar-volman
    yazi
    git
    fd
    rust-analyzer
    cargo
    rustc
    python315
    fish
    xonsh
    papirus-icon-theme
    trash-cli
];

gtk = {
    enable = true;

  iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
   };

   theme = {
       name = "Adwaita-dark";
       package = pkgs.gnome-themes-extra;
   };

};



 #programs.vim.enable = true;
}
