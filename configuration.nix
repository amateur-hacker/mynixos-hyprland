{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  programs.hyprland.enable = true;

  # programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.hyprlock.enable = true;
  programs.thunar.enable = true;
  # programs.dms-shell = {
  #   enable = true;
  #
  #   systemd = {
  #     enable = true; # Systemd service for auto-start
  #     restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
  #   };
  #
  #   # Core features
  #   enableSystemMonitoring = true; # System monitoring widgets (dgop)
  #   enableClipboard = true; # Clipboard history manager
  #   enableVPN = true; # VPN management widget
  #   enableDynamicTheming = true; # Wallpaper-based theming (matugen)
  #   enableAudioWavelength = true; # Audio visualizer (cava)
  #   enableCalendarEvents = true; # Calendar integration (khal)
  # };

  environment.systemPackages = with pkgs; [ wget git tree ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}

