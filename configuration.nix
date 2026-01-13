{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  environment.etc."/brave/policies/managed/GroupPolicy.json".text = ''
    {
     "BrowserSignin": 0,
      "PasswordManagerEnabled": false,
      "SpellcheckEnabled": true,
      "SpellcheckLanguage": [
        "en-US"
      ],
      "TorDisabled": true,
      "BraveRewardsDisabled": true,
      "BraveWalletDisabled": true,
      "BraveVPNDisabled": true,
      "BraveAIChatEnabled": false,
      "BraveNewsDisabled": true,
      "BraveTalkDisabled": true,
      "BraveSpeedreaderEnabled": false,
      "BraveP3AEnabled": false,
      "BraveStatsPingEnabled": false,
      "BraveWebDiscoveryEnabled": false
    }
  '';
  programs.xonsh.enable = true;
  environment.shells = ["/run/current-system/sw/bin/xonsh"];

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
    enable = false;
    settings.default_session = {
      command = "start-hyprland";
      user = "jay";
    };
  };

  services.displayManager.ly.enable = true;

  users.users.jay = {
    isNormalUser = true;
    shell = pkgs.xonsh;
    extraGroups = [
    "flatpak"
      "disk"
      "qemu"
      "kvm"
      "libvirtd"
      "sshd"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "root"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  # programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim  
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  nix = {
    settings = {
        warn-dirty = false;
        experimental-features = ["nix-command" "flakes"];
        auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config = {
        allowUnfree = true;
    };
  };

  system.stateVersion = "25.11";
}
