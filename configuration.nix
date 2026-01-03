{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-jay";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  hardware.bluetooth.enable = true;
  services.printing.enable = true;
  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "start-hyprland";
      user = "jay";
    };
  };

  users.users.jay = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      tree
    ];
  };

  # programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    vimPlugins.nvim-cmp
    vimPlugins.nvim-treesitter
    vimPlugins.telescope-nvim
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
    home-manager
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
}
