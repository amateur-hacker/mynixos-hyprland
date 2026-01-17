{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "machine";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Kolkata";

  programs.hyprland.enable = true;

  # Use fish by default for all users
  users.defaultUserShell = pkgs.fish;

  users.users.amateur_hacker = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    # To set password in declarative way use 'mkpasswd -m sha-512 "mypassword"'
    hashedPassword =
      "$6$QfZdw3HTtKJmu7GK$mba88FSTf9HNAQPhC/nEYhf/K/4VJycK0NUe6my3Cy6QP7bR3rfuzubPL9Cj1lGDCCoMfDVOP7m2Z58IMX5es0";
    # packages = with pkgs; [ ];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    foot
    kitty
    waybar
    git
    hyprpaper
    tree
    neovim
    ungoogled-chromium
  ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}

